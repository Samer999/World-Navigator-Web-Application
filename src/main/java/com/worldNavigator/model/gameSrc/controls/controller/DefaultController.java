package com.worldNavigator.model.gameSrc.controls.controller;

import com.worldNavigator.model.gameSrc.playerInfo.Player;
import com.worldNavigator.model.gameSrc.controls.commands.Command;
import com.worldNavigator.model.gameSrc.controls.commands.playerCommands.*;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.ArrayList;

public class DefaultController extends Thread {

	private int port;
	private Player player;
	private Socket socket;
	private DataInputStream in;
	private DataOutputStream out;
	private ArrayList<Command> commands;

	public DefaultController(Player player, int port) {

		this.player = player;
		this.port = port;
		commands = new ArrayList<Command>();

	}

	public void writeNext() {
		try {
			out.writeUTF("--+");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void readNext() {
		try {
			out.writeUTF("---");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void run() {
		try {
			Thread.sleep(1000);
			socket = new Socket("localhost", port);
			in = new DataInputStream(socket.getInputStream());
			out = new DataOutputStream(socket.getOutputStream());
			setDefaultCommands();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		while (!socket.isClosed()) {
			System.out.println("controller is on");
			showCommands();
			executeCommand();
			
		}
	}

	public void setDefaultCommands() {
		commands.clear();
		commands.add(new ForwardCommand(player, in, out));
		commands.add(new BackwardCommand(player, in, out));
		commands.add(new TurnLeftCommand(player, in, out));
		commands.add(new TurnRightCommand(player, in, out));
		commands.add(new LookCommand(player, in, out));
		commands.add(new CheckCommand(player, in, out));
		commands.add(new OpenCommand(player, in, out));
		commands.add(new HoldLightCommand(player, in, out));
		commands.add(new UseHeldLightCommand(player, in, out));
		commands.add(new DropHeldLightCommand(player, in, out));
		commands.add(new ItemsOfFacedTraderCommand(player, in, out));
		commands.add(new PlayerStatusCommand(player, in, out));
		commands.add(new SwitchRoomLightCommand(player, in, out));
		commands.add(new TradeCommand(player, in, out));
		commands.add(new UseKeyCommand(player, in, out));
	}

	public void showCommands() {
		writeNext();
		StringBuilder commandList = new StringBuilder();
		for (int i = 0; i < commands.size(); i++) {
			commandList.append(String.format("%d : %s\n", i, commands.get(i).name()));
		}

		try {
			out.writeUTF(commandList.toString());
		} catch(SocketException e) {
			e.printStackTrace();
			try {
				socket.close();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		} catch (IOException e) {
			try {
				socket.close();
			} catch (IOException ioException) {
				ioException.printStackTrace();
			}
			e.printStackTrace();
		} 
	}

	public void executeCommand() {
		readNext();
		String input;
		int ind = 0;
		try {
			input = in.readUTF();
			ind = Integer.parseInt(input);
		} catch(SocketException e) {
			e.printStackTrace();
			try {
				socket.close();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		} catch (IOException | NumberFormatException e) {
			e.printStackTrace();
			try {
				out.writeUTF("Invalid index!");
			} catch (IOException e1) {
				try {
					socket.close();
				} catch (IOException ioException) {
					ioException.printStackTrace();
				}
				e1.printStackTrace();
			}
			return;
		}
		if (ind >= commands.size()) {
			writeNext();
			try {
				out.writeUTF("Command Index is invalid!");
			} catch (IOException e) {

				e.printStackTrace();
			}
		}
		else commands.get(ind).execute();
	}

}
