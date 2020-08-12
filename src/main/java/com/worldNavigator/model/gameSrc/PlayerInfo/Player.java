package com.worldNavigator.model.gameSrc.PlayerInfo;

import com.worldNavigator.model.gameSrc.Directions.Direction;
import com.worldNavigator.model.gameSrc.Items.Item;
import com.worldNavigator.model.gameSrc.Items.Key;
import com.worldNavigator.model.gameSrc.Items.Light;
import com.worldNavigator.model.gameSrc.Map.RoomObjects.*;

public class Player extends Trader {

	private Direction facingDirection;
	private Light heldLight;
	private Room currentRoom;

	public Player() {
		super(0);
		facingDirection = Direction.NORTH; // default facing direction, it could be changed
	}

	public void setDirection(Direction direction) {
		if (direction == null) {
			throw new NullPointerException("direction value is null!");
		}

		facingDirection = direction;
	}

	public void cancelBuying() {
		System.out.println("I don't have enough gold, sad!");
	}

	public void cancelSelling() {
		System.out.println("You don't have enough gold to buy this item, sorry!");
	}

	public RoomObject facingRoomObject() {
		return currentRoom.getRoomObject(facingDirection);
	}

	public Direction getFacingDirection() {
		return facingDirection;
	}

	public Room getCurrentRoom() {
		return currentRoom;
	}

	public void setCurrentRoom(Room currentRoom) {
		if (currentRoom == null) {
			throw new NullPointerException("room value is null!");
		}

		this.currentRoom = currentRoom;
	}

	public boolean isHoldingLight() {
		return heldLight != null;
	}

	public void turnLeft() {
		facingDirection = Direction.turnLeft(facingDirection);
	}

	public void turnRight() {
		facingDirection = Direction.turnRight(facingDirection);
	}

	public String forward() {

		RoomObject roomObject = currentRoom.getRoomObject(facingDirection);
		if (!(roomObject instanceof Entryway)) {
			return ("This is not a entry way!");
		} else if (!((Entryway) roomObject).isUnlocked()) {
			return ("This entry way is locked!");
		} else if (!((Entryway) roomObject).isOpen()) {
			return ("This entry way is closed!");
		} else {
			currentRoom = ((Entryway) facingRoomObject()).getRoom(facingDirection);
			return "Success";
		}
	}

	public String backward() {

		RoomObject roomObject = currentRoom.getRoomObject(Direction.oppositeDirection(facingDirection));
		if (!(roomObject instanceof Entryway)) {
			return ("This is not a entry way!");
		} else if (!((Entryway) roomObject).isUnlocked()) {
			return ("This entry way is locked!");
		} else if (!((Entryway) roomObject).isOpen()) {
			return ("This entry way is closed!");
		} else {
			currentRoom = ((Entryway) roomObject).getRoom(Direction.oppositeDirection(facingDirection));
			return "Success";
		}
	}

	public String look() {
		if (!currentRoom.isLightSwitchOn() && (heldLight == null || !heldLight.isLightOn())) {
			return ("Dark! Nothing to see");
		}

		return (facingRoomObject().look());
	}

	public void check() {

		if (!(facingRoomObject() instanceof Checkable)) {
			System.out.println("Nothing to check here!");
			return;
		}

		Checkable checkable = (Checkable) facingRoomObject();

		if (checkable == null) {
			throw new IllegalArgumentException("checkable value is null!");
		}

		System.out.println(checkable.check());

		if (checkable instanceof LootHider) {
			((LootHider) checkable).loot(this);
		}
	}

	public void holdLight(Light light) {

		if (light == null) {
			throw new IllegalArgumentException("light value is null!");
		}

		if (heldLight != null) // if the player is holding a light, put it in inventory so he holds the other
								// one
		{
			giveItem(heldLight);
		}

		heldLight = light;
	}

	public void dropHeldLight() {

		if (heldLight == null) {
			System.out.println("I am not holding a light source to drop it!");
		} else {
			giveItem(heldLight);
			heldLight = null;
		}
	}

	public void useHeldLight() {

		if (heldLight == null) {
			System.out.println("I am not holding a light source to use it!");
		} else {
			heldLight.toggle();
		}
	}

	public String open() {
		if (!(facingRoomObject() instanceof Closeable)) {
			return ("Cant open this!");
		} else if (facingRoomObject() instanceof Lockable) {
			if (!((Lockable)facingRoomObject()).isUnlocked()) {
				return "it's Locked, "+ ((Lockable)facingRoomObject()).getKeyName() + " is needed to unlock";
			}
		}
		
		((Lockable) facingRoomObject()).open();
		return "Done, " + facingRoomObject().look() + " is open";

	}

	public void switchRoomLight() {
		if (currentRoom.isLightSwitchAvailable()) {
			currentRoom.switchLightSwitch();
		} else {
			System.out.println("no light switch to switch");
		}
	}

	public String itemsOfFacedTrader() {
		if (!(facingRoomObject() instanceof Trader)) {
			return "You are not facing a trader!";
		} else {
			return ((Trader) facingRoomObject()).getItemStatus().toString();
		}
	}

	public void useKey(Key key) {
		if (facingRoomObject() instanceof Lockable) {
			useKey((Lockable) facingRoomObject(), key);
		} else {
			System.out.println("What you are facing doesn't need a key!");
		}
	}

	private void useKey(Lockable lockable, Key key) {

		if (lockable == null) {
			throw new IllegalArgumentException("lockable value is null!");
		}

		if (key == null) {
			throw new IllegalArgumentException("key value is null!");
		}

		lockable.useKey(key);
	}

	@Override
	public void proceedBuying(Item item) {

		if (item == null) {
			throw new IllegalArgumentException("item value is null!");
		}

		takeAwayGold(item.getPrice());
		giveItem(item);
		System.out.println(item + "  bought and acquired");
	}

	@Override
	public void proceedSelling(Item item) {

		if (item == null) {
			throw new IllegalArgumentException("item value is null!");
		}

		System.out.println(item + " has been sold for " + item.getPrice() + " Gold successfully!");
		takeAwayItem(item);
		giveGold(item.getPrice());
	}

	@Override
	public StringBuilder getStatus() {
		return new StringBuilder(
				"player status :\n" + "player facing direction : " + facingDirection + "\n" + super.getStatus());
	}

	@Override
	public StringBuilder getItemStatus() {
		return new StringBuilder("Player items :\n" + super.getItemStatus());
	}
}
