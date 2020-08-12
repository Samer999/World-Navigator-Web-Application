package com.worldNavigator.model.gameSrc.Map.RoomObjects;

import com.worldNavigator.model.gameSrc.Items.Key;
import com.worldNavigator.model.gameSrc.PlayerInfo.Player;

import java.util.Objects;

public class Chest extends Lockable implements RoomObject, Checkable, LootHider {

  private FullLoot loot;

  public Chest() {}

  public Chest(Key lockKey) {
    super(lockKey);
  }

  @Override
  public Loot getLoot() {
    return loot;
  }

  public void setLoot(FullLoot loot) {
    if (loot == null) throw new NullPointerException("this loot value is null!");

    this.loot = loot;
  }

  @Override
  public String look() {
    return "Chest";
  }

  @Override
  public String check() {
    if (!isUnlocked()) {
      return "Chest is locked, " + getKeyName() + " key is needed to unlock";
    } else if (isOpen()) {
      return "Chest is opened and looted";
    } else {
      return "checking the chest...";
    }
  }

  @Override
  public void loot(Player player) {
    if (player == null) throw new NullPointerException("player value is null!");
    if (isUnlocked()) {
      loot.loot(player);
    }
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    Chest chest = (Chest) o;
    return loot.equals(chest.loot);
  }

  @Override
  public int hashCode() {
    return Objects.hash(loot);
  }
}
