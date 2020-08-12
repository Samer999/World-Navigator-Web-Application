package com.worldNavigator.model.gameSrc.controls.commands.playerCommands;

import com.worldNavigator.model.gameSrc.PlayerInfo.Player;
import com.worldNavigator.model.gameSrc.controls.commands.Command;

import java.io.DataInputStream;
import java.io.DataOutputStream;

public abstract class PlayerCommand extends Command {

	private Player player;
	

	public PlayerCommand(Player player, DataInputStream in, DataOutputStream out) {
		super(in, out);
		this.player = player;
	}


	public Player getPlayer() {
		return player;
	}

}
