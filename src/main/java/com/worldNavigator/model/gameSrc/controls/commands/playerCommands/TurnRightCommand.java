package com.worldNavigator.model.gameSrc.controls.commands.playerCommands;

import com.worldNavigator.model.gameSrc.PlayerInfo.Player;

import java.io.DataInputStream;
import java.io.DataOutputStream;

public class TurnRightCommand extends PlayerCommand {

	public TurnRightCommand(Player player, DataInputStream in, DataOutputStream out) {
		super(player, in, out);
	}

	@Override
	public void execute() {
		getPlayer().turnLeft();
		write("Turned right successfully");
	}

	@Override
	public String name() {
		return "Turn Right";
	}

}
