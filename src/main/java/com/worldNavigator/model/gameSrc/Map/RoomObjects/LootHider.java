package com.worldNavigator.model.gameSrc.Map.RoomObjects;

import com.worldNavigator.model.gameSrc.PlayerInfo.Player;

/**
 * LootHider hides the loot, it must contains a loot object and a loot() function so the player can
 * get this loot
 */
public interface LootHider {

  Loot getLoot();

  void loot(Player player);
}
