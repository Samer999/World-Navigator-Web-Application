package com.worldNavigator.model.gameSrc.controls.commands.playerCommands;

import com.worldNavigator.model.gameSrc.playerInfo.Player;

import java.io.DataInputStream;
import java.io.DataOutputStream;

public class DropHeldLightCommand extends PlayerCommand {

	public DropHeldLightCommand(Player player, DataInputStream in, DataOutputStream out) {
		super(player, in, out);
	}

	@Override
	public void execute() {
		if (!getPlayer().isHoldingLight()) {
			write("Not holding a light source to drop it!");
			return;
		}
		getPlayer().dropHeldLight();
		write("Done dropping held light");		
	}

	@Override
	public String name() {
		return "Drop held light back to inventory";
	}

}
