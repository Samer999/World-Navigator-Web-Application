package com.worldNavigator.model.gameSrc.controls;

import com.worldNavigator.model.gameSrc.map.Map;
import com.worldNavigator.model.gameSrc.map.MapCreator;
import com.worldNavigator.model.gameSrc.map.MapLoader;

import java.io.File;
import java.io.IOException;
import java.net.ServerSocket;
import java.util.ArrayList;


/**
 * GameDriver is the main entity in this game It controls the different maps and game modes that it
 * has to offer
 */
public class GameDriver {

    private static GameDriver gameDriver = new GameDriver();
    private ArrayList<File> maps;

    private GameDriver() {
        MapCreator mapCreator = new MapCreator();
        maps = new ArrayList<File>();
        findMaps();
    }

    public static GameDriver getInstance() {
        return gameDriver;
    }

    private void findMaps() {
        File file = new File("maps_folder");
        System.out.println(file.getAbsolutePath() + " " + file.exists());
        for (File fileEntry : file.listFiles()) {
            if (fileEntry.isDirectory()) {
                continue;
            }
            maps.add(fileEntry);
        }
    }

    public ArrayList<File> getMaps() {
        return maps;
    }

    public Map getMap(int index) {
        if (index < 0 || index > maps.size()) {
            throw new IndexOutOfBoundsException();
        }
        return new MapLoader(maps.get(index)).getMap();
    }

    public int getFreePort() {
        int port = 3000;
        while (port <= 65000) {
            try (ServerSocket ignored = new ServerSocket(port)) {
                System.out.println("free port to use " + port);
                break;
            } catch (IOException ignored) {
                port++;
                System.out.println(port + " " + ignored);
            }
        }
        return port;
    }

}
