package com.worldNavigator.model.gameSrc.controls.commands.playerCommands;

import com.worldNavigator.model.gameSrc.playerInfo.Player;

import java.io.DataInputStream;
import java.io.DataOutputStream;

public class TurnLeftCommand extends PlayerCommand {


	public TurnLeftCommand(Player player, DataInputStream in, DataOutputStream out) {
		super(player, in, out);
	}

	@Override
	public void execute() {
		getPlayer().turnLeft();
		write("Turned left successfully");
	}

	@Override
	public String name() {
		return "Turn Left";
	}

}
