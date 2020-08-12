package com.worldNavigator.model.gameSrc.controls.gameModes;

import com.worldNavigator.model.dataBase.DataProvider;
import com.worldNavigator.model.gameSrc.map.Map;
import com.worldNavigator.model.gameSrc.playerInfo.Player;
import com.worldNavigator.model.gameSrc.controls.gameTimer.GameTimer;

import javax.servlet.http.HttpSession;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;


public class SinglePlayerMode extends Thread {

    private boolean running;
    private int port;
    private Player winner;
    private Player player;
    private HttpSession session;
    private Map map;

    public SinglePlayerMode(Player player, HttpSession session, int port, Map map) {
        this.player = player;
        this.session = session;
        this.port = port;
        this.map = map;
    }

    private void setDefaultValues() {
        player.setCurrentRoom(map.getStartRoom());
        player.setDirection(map.getPlayerFacingDirection());
        player.giveGold(map.getInitialGold());
    }

    public boolean isRunning() {
        return running;
    }

    public boolean hasWinner() {
        return winner != null;
    }

    @Override
    public void run() {
        setDefaultValues();
        GameTimer timer = new GameTimer(map.getTimeToFinish());
        timer.start();
        running = true;

        try {
            ServerSocket server = new ServerSocket(port);
            Socket co = server.accept();
            DataInputStream in = new DataInputStream(co.getInputStream());
            DataOutputStream out = new DataOutputStream(co.getOutputStream());

            while (isRunning()) {
                String controllerMssg = in.readUTF();
                StringBuilder finalMssg = new StringBuilder();
                while (controllerMssg.equals("--+")) {
                    finalMssg.append(in.readUTF() + "\n");
                    controllerMssg = in.readUTF();
                }
                if (timer.isTimeOut()) {
                    finalMssg = new StringBuilder("You have Lost! Timeout...");
                    session.setAttribute("result", finalMssg);
                    co.close();
                    server.close();
                    return;
                }

                if (player.getCurrentRoom() == map.getGoalRoom()) {
                    finalMssg = new StringBuilder("You have Won!");
                    DataProvider dataProvider = DataProvider.getInstance();
                    int id = Integer.parseInt(session.getAttribute("user_id").toString());
                    dataProvider.addWin(id);
                    session.setAttribute("user_wins", dataProvider.getNumberOfWins(session.getAttribute("user_email").toString()));
                    session.setAttribute("result", finalMssg);
                    co.close();
                    server.close();
                    return;
                }

                session.setAttribute("result", finalMssg);

                while (session.getAttribute("index") == null) {
                    Thread.sleep(100);
                }
                if (session.getAttribute("index").equals("quit_game")) {
                    finalMssg = new StringBuilder("You have Lost! You Quit...");
                    session.setAttribute("index", null);
                    session.setAttribute("result", finalMssg);
                    co.close();
                    server.close();
                    return;
                }
                out.writeUTF(session.getAttribute("index").toString());
                session.setAttribute("index", null);
            }

        } catch (IOException e1) {
            e1.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }


    }

}
