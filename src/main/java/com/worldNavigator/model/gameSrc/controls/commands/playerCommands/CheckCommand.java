package com.worldNavigator.model.gameSrc.controls.commands.playerCommands;

import com.worldNavigator.model.gameSrc.map.roomObjects.*;
import com.worldNavigator.model.gameSrc.playerInfo.Player;

import java.io.DataInputStream;
import java.io.DataOutputStream;

public class CheckCommand extends PlayerCommand {



	public CheckCommand(Player player, DataInputStream in, DataOutputStream out) {
		super(player, in, out);
	}

	@Override
	public void execute() {
		if (!(getPlayer().facingRoomObject() instanceof Checkable)) {
			write("Nothing to check here!");
			return;
		}

		Checkable checkable = (Checkable) getPlayer().facingRoomObject();

		if (checkable == null) {
			throw new IllegalArgumentException("checkable value is null!");
		}

		write(checkable.check());

		if (checkable instanceof LootHider) {
			if (checkable instanceof Lockable) {
				if (!((Lockable) checkable).isUnlocked()) {
					write("It's closed can't check or open");
					return;
				}
			}
			
			Loot loot = ((LootHider) checkable).getLoot();
			
			if (loot instanceof FullLoot) {
				FullLoot fullLoot = (FullLoot) loot;
				write(fullLoot.itemList());
			}
			else {
				OneKeyLoot oneKeyLoot = (OneKeyLoot) loot;
				if (oneKeyLoot.keyExist())
					write(oneKeyLoot.keyLoot());
				else {
					write("No key is hidden here!");
					return;
				}
			}
			
			write("looted successfully");
			((LootHider) checkable).loot(getPlayer());
		}

	}
	
	
	/*
	 * LootHider lootHider = (LootHider)checkable;
			if (lootHider.getLoot() instanceof FullLoot) {
				FullLoot fullLoot = (FullLoot) lootHider.getLoot();
				write(fullLoot.itemList());
			} else {
				OneKeyLoot oneKeyLoot = (OneKeyLoot) lootHider.getLoot();
				write(oneKeyLoot.keyLoot());
			}
			((LootHider) checkable).loot(getPlayer());
			write("looted successfully");
	 * 
	 * */

	@Override
	public String name() {
		return "Check";
	}

}
