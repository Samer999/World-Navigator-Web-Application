package com.worldNavigator.model.gameSrc.controls.controller;


public interface Controller {
	void showCommands();
	void executeCommand();
	void setDefaultCommands();
	void writeNext();
	void readNext();
	void start();
	boolean isWinner();
}
