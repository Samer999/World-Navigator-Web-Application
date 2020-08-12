package com.worldNavigator.model.gameSrc.controls.commands.playerCommands;

import com.worldNavigator.model.gameSrc.Items.Item;
import com.worldNavigator.model.gameSrc.Map.RoomObjects.RoomObject;
import com.worldNavigator.model.gameSrc.PlayerInfo.Player;
import com.worldNavigator.model.gameSrc.PlayerInfo.Trader;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.util.InputMismatchException;

public class SellCommand extends PlayerCommand {


	public SellCommand(Player player, DataInputStream in, DataOutputStream out) {
		super(player, in, out);
	}

	@Override
	public void execute() {

		RoomObject roomObject = getPlayer().facingRoomObject();

		if (!(roomObject instanceof Trader)) {
			write("You are not facing a trader or a seller! selling is canceled...");
			return;
		}

		Trader trader = (Trader) roomObject;

		int index = 0;

		Item item = null;

		write("This is your items, pick item to sell by it's index");
		write(getPlayer().getItemStatus().toString());

		try {

			index = Integer.parseInt(read());

			if (!getPlayer().isValidItemIndex(index)) {
				throw new InputMismatchException();
			}

			item = getPlayer().getItemByIndex(index);

		} catch (InputMismatchException e) {
			write("This is not a valid index! selling is canceled...");
			return;
		}

		
		write(item.toString() + " has been sold");
		trader.giveItem(item);
		trader.takeAwayGold(item.getPrice());
		getPlayer().takeAwayItem(item);
		getPlayer().giveGold(item.getPrice());
	}

	@Override
	public String name() {
		return "Sell Item";
	}

}
