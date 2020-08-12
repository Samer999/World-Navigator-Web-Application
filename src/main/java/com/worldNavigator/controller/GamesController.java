package com.worldNavigator.controller;


import com.worldNavigator.model.gameSrc.playerInfo.Player;
import com.worldNavigator.model.gameSrc.controls.GameDriver;
import com.worldNavigator.model.gameSrc.controls.controller.DefaultController;
import com.worldNavigator.model.gameSrc.controls.gameModes.SinglePlayerMode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("Game")
public class GamesController {
    @RequestMapping("GameMenu")
    public String gameMenu() {
        return "game_menu";
    }

    @RequestMapping("SinglePlayerStartMenu")
    public String singlePlayerStart() {
        return "single_player_start";
    }

    @RequestMapping("SinglePlayerStarter")
    public String singlePlayerStarter(HttpServletRequest request) {

        GameDriver gameDriver = GameDriver.getInstance();
        HttpSession session = request.getSession();
        session.setAttribute("result", "Enter any number to see commands");

        Player player = new Player();
        int freePort = gameDriver.getFreePort();
        SinglePlayerMode mode = new SinglePlayerMode(player, session, freePort, gameDriver.getMap(Integer.parseInt(request.getParameter("map"))));
        DefaultController controller = new DefaultController(player, freePort);
        mode.start();
        controller.start();
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return "controller";
    }

    @RequestMapping("HandIndex")
    public String handIndex(HttpServletRequest request) {
        HttpSession session = request.getSession();

        if (request.getParameter("index") != null && request.getParameter("index").length() > 0)
            session.setAttribute("index", request.getParameter("index"));

        if (request.getParameter("btnSubmit") != null) {
            if (request.getParameter("btnSubmit").equals("Quit")) {
                session.setAttribute("index", "quit_game");
            }
        }

        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        return "controller";
    }
}
