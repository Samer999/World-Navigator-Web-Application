package com.worldNavigator.model.gameSrc.map;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;

public class MapLoader {

  private Map map;
  private File file;

  public MapLoader(File file) {
    if (file == null) {
      throw new NullPointerException("file value is null!");
    }
    this.file = file;
  }

  public Map getMap() {
    load();
    return map;
  }

  public String getName() {
    return file.getName();
  }

  private void load() { // proxy pattern

    if (map != null) {
      return;
    }

    try {
      System.out.println("file exist " + file.exists() + " " + file.getAbsolutePath());
      FileInputStream fileInputStream = new FileInputStream(file);
      ObjectInputStream objectInputStream = new ObjectInputStream(fileInputStream);
      Object obj = objectInputStream.readObject();
      System.out.println(obj instanceof Map);
      map = (Map) obj;

    } catch (IOException|ClassNotFoundException e) {
      System.out.println("cant load map!");
      e.printStackTrace();
    } 
  }
}
