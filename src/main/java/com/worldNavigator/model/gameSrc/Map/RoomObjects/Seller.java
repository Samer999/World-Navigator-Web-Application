package com.worldNavigator.model.gameSrc.Map.RoomObjects;

import com.worldNavigator.model.gameSrc.Items.Item;
import com.worldNavigator.model.gameSrc.PlayerInfo.Trader;

public class Seller extends Trader implements RoomObject {

  public Seller() {
    super(Integer.MAX_VALUE / 2); // seller is rich so he has a lot of money
  }

  public String look() {
    return "Seller";
  }

  public void cancelBuying() {
    System.out.println("I don't have enough gold :(");
  }

  public void cancelSelling() {
    System.out.println("Return when you have enough gold");
  }

  public void proceedBuying(Item item) {

    if (item == null) {
      throw new NullPointerException("item value is null!");
    }

    takeAwayGold(item.getPrice());
    giveItem(item);
  }

  public void proceedSelling(Item item) {

    if (item == null) {
      throw new NullPointerException("item value is null!");
    }

    takeAwayItem(item);
    giveGold(item.getPrice());
  }

  @Override
  public StringBuilder getItemStatus() {
    StringBuilder itemStatus = new StringBuilder("Seller's ").append(super.getItemStatus());

    return itemStatus;
  }
}
