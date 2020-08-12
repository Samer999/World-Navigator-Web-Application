package com.worldNavigator.model.gameSrc.controls.commands.playerCommands;

import com.worldNavigator.model.gameSrc.PlayerInfo.Player;

import java.io.DataInputStream;
import java.io.DataOutputStream;

public class UseHeldLightCommand extends PlayerCommand {


	  public UseHeldLightCommand(Player player, DataInputStream in, DataOutputStream out) {
		super(player, in, out);
	}

	@Override
	  public void execute() {
	    if (getPlayer().isHoldingLight()) {
	    	getPlayer().useHeldLight();
	    	write("Held light switch is toggled");
	    } else 
	    	write("not holding a light source to use it!");
	  }

	  @Override
	  public String name() {
	    return "Use Held Light";
	  }

}
