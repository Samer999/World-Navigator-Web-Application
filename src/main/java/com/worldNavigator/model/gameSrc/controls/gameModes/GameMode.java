package com.worldNavigator.model.gameSrc.controls.gameModes;

public interface GameMode {
	
	boolean isRunning();
	boolean hasWinner();
	void start();
	void stop();
	
}
