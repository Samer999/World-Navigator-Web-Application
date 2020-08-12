package com.worldNavigator.model.gameSrc.map.roomObjects;

import com.worldNavigator.model.gameSrc.playerInfo.Player;

/**
 * Loot could be any type of items or gold with different quantities usually it's inside LootHider
 */
public interface Loot {

  void loot(Player player);
}
