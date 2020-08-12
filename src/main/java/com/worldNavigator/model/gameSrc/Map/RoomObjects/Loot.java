package com.worldNavigator.model.gameSrc.Map.RoomObjects;

import com.worldNavigator.model.gameSrc.PlayerInfo.Player;

/**
 * Loot could be any type of items or gold with different quantities usually it's inside LootHider
 */
public interface Loot {

  void loot(Player player);
}
