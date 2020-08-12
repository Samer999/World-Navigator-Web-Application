package com.worldNavigator.model.gameSrc.controls.commands.playerCommands;

import com.worldNavigator.model.gameSrc.playerInfo.Player;
import com.worldNavigator.model.gameSrc.playerInfo.Trader;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.util.InputMismatchException;

public class TradeCommand extends PlayerCommand {

	private BuyCommand buyCommand;
	private SellCommand sellCommand;
	private ItemsOfFacedTraderCommand itemsOfFacedTraderCommand;

	public TradeCommand(Player player, DataInputStream in, DataOutputStream out) {
		super(player, in, out);
		buyCommand = new BuyCommand(player, in, out);
		sellCommand = new SellCommand(player, in, out);
		itemsOfFacedTraderCommand = new ItemsOfFacedTraderCommand(player, in, out);
	}

	@Override
	public void execute() {

		if (!(getPlayer().facingRoomObject() instanceof Trader)) {
			write("You are not facing a trader!");
			return;
		}

		itemsOfFacedTraderCommand.execute();

		while (true) {
			int index = 0;

			write("What do you want to do next?\n" + "0 : Buy\n" + "1 : Sell\n"
					+ "2 : List the items of the trader you are facing\n" + "3 : Stop trading\n" + "Enter index : ");

			try {
				index = Integer.parseInt(read());

				if (index == 3) {
					write("Stop trading...");
					break;
				}

				if (index < 0 || index > 2) {
					throw new InputMismatchException();
				}

			} catch (InputMismatchException e) {
				write("Invalid command index! canceling trading...");
				break;
			}

			if (index == 0) {
				buyCommand.execute();
			} else if (index == 1) {
				sellCommand.execute();
			} else {
				itemsOfFacedTraderCommand.execute();
			}
		}
	}

	@Override
	public String name() {
		return "Trade";
	}

}
