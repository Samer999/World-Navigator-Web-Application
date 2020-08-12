package com.worldNavigator.model.gameSrc.controls.commands.playerCommands;

import com.worldNavigator.model.gameSrc.playerInfo.Player;

import java.io.DataInputStream;
import java.io.DataOutputStream;

public class BackwardCommand extends PlayerCommand {


	public BackwardCommand(Player player, DataInputStream in, DataOutputStream out) {
		super(player, in, out);
	}

	@Override
	public void execute() {
		write(getPlayer().backward());
	}

	@Override
	public String name() {
		return "Go Backward";
	}

}
