package com.worldNavigator.model.gameSrc.controls.commands.playerCommands;

import com.worldNavigator.model.gameSrc.playerInfo.Player;

import java.io.DataInputStream;
import java.io.DataOutputStream;

public class SwitchRoomLightCommand extends PlayerCommand {

	public SwitchRoomLightCommand(Player player, DataInputStream in, DataOutputStream out) {
		super(player, in, out);
	}

	@Override
	public void execute() {
		getPlayer().switchRoomLight();
		write("Room light switched");
	}

	@Override
	public String name() {
		return "Switch Room Light";
	}

}
