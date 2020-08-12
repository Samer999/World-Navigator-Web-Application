package com.worldNavigator.model.gameSrc.controls.commands.playerCommands;

import com.worldNavigator.model.gameSrc.items.Item;
import com.worldNavigator.model.gameSrc.items.Key;
import com.worldNavigator.model.gameSrc.map.roomObjects.Lockable;
import com.worldNavigator.model.gameSrc.playerInfo.Player;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.util.InputMismatchException;

public class UseKeyCommand extends PlayerCommand {


	public UseKeyCommand(Player player, DataInputStream in, DataOutputStream out) {
		super(player, in, out);
	}

	@Override
	public void execute() {

		int index = 0;

		Item item = null;

		write(getPlayer().getItemStatus().toString());

		try {

			index = Integer.parseInt(read());

			if (!getPlayer().isValidItemIndex(index)) {
				throw new InputMismatchException();
			}

			item = getPlayer().getItemByIndex(index);

			if (!(item instanceof Key)) {
				throw new InputMismatchException();
			}

		} catch (InputMismatchException e) {
			write("This is not a valid key index!");
			return;
		}

		if (getPlayer().facingRoomObject() instanceof Lockable) {
			Lockable lockable = (Lockable) getPlayer().facingRoomObject();
			if (!lockable.hasLock())
				write("You can't use key, no lock is here");
			else {
				lockable.close(); // make sure to close the door if it was opened, so the key get tested
				if (lockable.getKeyName() != ((Key) item).getName())
					write("This key doesn't work in this lockable");
				else {
					lockable.useKey((Key) item);
					write(String.format("%s key is used and this lockable is %s", ((Key) item).getName(), lockable.isUnlocked() ? "unloacked" : "locked"));
				}
			}
		} else
			write("What you are facing doesn't need a key!");
	}

	@Override
	public String name() {
		return "Use Key";
	}

}
