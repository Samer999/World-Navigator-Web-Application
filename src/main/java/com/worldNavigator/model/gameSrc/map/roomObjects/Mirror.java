package com.worldNavigator.model.gameSrc.map.roomObjects;

import com.worldNavigator.model.gameSrc.items.Key;
import com.worldNavigator.model.gameSrc.playerInfo.Player;

import java.io.Serializable;
import java.util.Objects;

public class Mirror implements LootHider, Checkable, RoomObject, Serializable {

  private OneKeyLoot keyLoot;

  public Mirror() {
    keyLoot = new OneKeyLoot();
  }

  public Mirror(Key keyLoot) {

    if (keyLoot == null) {
      throw new NullPointerException("key value is null!");
    }

    this.keyLoot = new OneKeyLoot(keyLoot);
  }

  @Override
  public String check() {
    return "checking behind the mirror...";
  }

  @Override
  public Loot getLoot() {
    return keyLoot;
  }

  @Override
  public void loot(Player player) {
    keyLoot.loot(player);
  }

  @Override
  public String look() {
    return "You See a silhouette of you";
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    Mirror mirror = (Mirror) o;
    return keyLoot.equals(mirror.keyLoot);
  }

  @Override
  public int hashCode() {
    return Objects.hash(keyLoot);
  }
}
