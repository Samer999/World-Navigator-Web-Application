package com.worldNavigator.model.gameSrc.map.roomObjects;

import com.worldNavigator.model.gameSrc.playerInfo.Player;

/**
 * LootHider hides the loot, it must contains a loot object and a loot() function so the player can
 * get this loot
 */
public interface LootHider {

  Loot getLoot();

  void loot(Player player);
}
