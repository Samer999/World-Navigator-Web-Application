package com.worldNavigator.model.gameSrc.controls.commands.playerCommands;

import com.worldNavigator.model.gameSrc.PlayerInfo.Player;

import java.io.DataInputStream;
import java.io.DataOutputStream;

public class ItemsOfFacedTraderCommand extends PlayerCommand {


	public ItemsOfFacedTraderCommand(Player player, DataInputStream in, DataOutputStream out) {
		super(player, in, out);
	}

	@Override
	public void execute() {
		write(getPlayer().itemsOfFacedTrader());
	}

	@Override
	public String name() {
		return "Items Of Faced Trader";
	}

}
