package com.worldNavigator.model.gameSrc.map;

import com.worldNavigator.model.gameSrc.directions.Direction;
import com.worldNavigator.model.gameSrc.map.roomObjects.Room;

import java.io.Serializable;

public class Map implements Serializable {

  private Room startRoom;
  private Room goalRoom;
  private int timeToFinish;
  private int initialGold;
  private Direction playerFacingDirection;

  public Map(
      Room startRoom,
      Room goalRoom,
      int timeToFinish,
      int initialGold,
      Direction playerFacingDirection) {

    if (startRoom == null) {
      throw new NullPointerException("start room value is null!");
    }

    if (goalRoom == null) {
      throw new NullPointerException("goa room value is null!");
    }

    if (timeToFinish < 0) {
      throw new IllegalArgumentException("time to finish value is invalid");
    }

    if (initialGold < 0) {
      throw new IllegalArgumentException("initial gold value is invalid");
    }

    if (playerFacingDirection == null) {
      throw new NullPointerException("player facing direction value is null!");
    }

    this.startRoom = startRoom;
    this.goalRoom = goalRoom;
    this.timeToFinish = timeToFinish;
    this.initialGold = initialGold;
    this.playerFacingDirection = playerFacingDirection;
  }

  public Room getStartRoom() {
    return startRoom;
  }

  public Room getGoalRoom() {
    return goalRoom;
  }

  public int getTimeToFinish() {
    return timeToFinish;
  }

  public int getInitialGold() {
    return initialGold;
  }

  public Direction getPlayerFacingDirection() {
    return playerFacingDirection;
  }
}
