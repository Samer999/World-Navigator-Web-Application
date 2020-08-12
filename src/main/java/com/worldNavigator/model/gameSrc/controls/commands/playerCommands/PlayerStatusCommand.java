package com.worldNavigator.model.gameSrc.controls.commands.playerCommands;

import com.worldNavigator.model.gameSrc.PlayerInfo.Player;

import java.io.DataInputStream;
import java.io.DataOutputStream;

public class PlayerStatusCommand extends PlayerCommand {

	public PlayerStatusCommand(Player player, DataInputStream in, DataOutputStream out) {
		super(player, in, out);
	}

	@Override
	public void execute() {
		write(getPlayer().getStatus().toString());
	}

	@Override
	public String name() {
		return "Player status";
	}

}
