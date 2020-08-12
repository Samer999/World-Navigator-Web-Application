package com.worldNavigator.model.gameSrc.controls.commands.playerCommands;

import com.worldNavigator.model.gameSrc.Items.Item;
import com.worldNavigator.model.gameSrc.Items.Light;
import com.worldNavigator.model.gameSrc.PlayerInfo.Player;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.util.InputMismatchException;

public class HoldLightCommand extends PlayerCommand {


	public HoldLightCommand(Player player, DataInputStream in, DataOutputStream out) {
		super(player, in, out);
	}

	@Override
	public void execute() {
		int index = 0;

		Item light = null;

		if (getPlayer().isHoldingLight()) {
			System.out.println("You are already holding a light, if you pick a light now, it would be replaced");
		}

		write(getPlayer().getItemStatus().toString());
		write("Enter light index : ");

		try {

			index = Integer.parseInt(read());
			if (!getPlayer().isValidItemIndex(index)) {
				throw new InputMismatchException();
			}

			light = getPlayer().getItemByIndex(index);

			if (!(light instanceof Light)) {
				throw new IllegalArgumentException();
			}

		} catch (InputMismatchException e) {
			write("This is not a valid index! holding a light is canceled...");
			return;
		} catch (IllegalArgumentException e) {
			write("This is not a light! holding a light is canceled...");
			return;
		}

		getPlayer().takeAwayItem(light);
		getPlayer().holdLight((Light) light);
		write("A light is in your hand");

	}

	@Override
	public String name() {
		return "Hold light from inventory";
	}

}
