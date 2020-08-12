package com.worldNavigator.model.gameSrc.map.roomObjects;

import java.io.Serializable;

public class PlainWall implements RoomObject, Serializable {

  public String look() {
    return "Wall";
  }
}
