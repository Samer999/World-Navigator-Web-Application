package com.worldNavigator.model.gameSrc.controls.commands.playerCommands;

import com.worldNavigator.model.gameSrc.playerInfo.Player;

import java.io.DataInputStream;
import java.io.DataOutputStream;

public class ForwardCommand extends PlayerCommand {

	public ForwardCommand(Player player, DataInputStream in, DataOutputStream out) {
		super(player, in, out);
	}

	@Override
	public void execute() {
		write(getPlayer().forward());
	}

	@Override
	public String name() {
		return "Go Forward";
	}

}
