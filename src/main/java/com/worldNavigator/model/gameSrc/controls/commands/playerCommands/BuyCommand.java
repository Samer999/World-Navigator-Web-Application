package com.worldNavigator.model.gameSrc.controls.commands.playerCommands;

import com.worldNavigator.model.gameSrc.items.Item;
import com.worldNavigator.model.gameSrc.map.roomObjects.RoomObject;
import com.worldNavigator.model.gameSrc.playerInfo.Player;
import com.worldNavigator.model.gameSrc.playerInfo.Trader;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.util.InputMismatchException;

public class BuyCommand extends PlayerCommand {


	public BuyCommand(Player player, DataInputStream in, DataOutputStream out) {
		super(player, in, out);
	}

	@Override
	public void execute() {
		RoomObject roomObject = getPlayer().facingRoomObject();

		if (!(roomObject instanceof Trader)) {
			write("You are not facing a trader! buying is canceled...");
			return;
		}

		Trader trader = (Trader) roomObject;

		int index = 0;

		Item item = null;

		write(trader.getItemStatus().toString());

		try {

			index = Integer.parseInt(read());

			if (!trader.isValidItemIndex(index)) {
				throw new InputMismatchException();
			}

			item = trader.getItemByIndex(index);

		} catch (InputMismatchException e) {

			write("This is not a valid index! buying is canceled...");

			return;
		}

		if (getPlayer().getGoldBalance() < item.getPrice()) {
			write("No enough gold, come back later!");
			return;
		}

		write(item.toString() + " has been bought");
		getPlayer().giveItem(item);
		getPlayer().takeAwayGold(item.getPrice());
		trader.takeAwayItem(item);
		trader.giveGold(item.getPrice());
	}

	@Override
	public String name() {
		return "Buy Item";
	}

}
