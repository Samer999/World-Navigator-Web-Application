package com.worldNavigator.model.gameSrc.map.roomObjects;

import com.worldNavigator.model.gameSrc.items.Key;

import java.util.Objects;

public abstract class Lockable extends Closeable {

  private Key lockKey;
  private boolean isUnlocked;

  public Lockable(Key lockKey) {
    if (lockKey == null) {
      throw new NullPointerException("key value is null!");
    }

    this.lockKey = lockKey;
  }

  public Lockable() {
    // default constructor
    isUnlocked = true; // because there is no lock
  }

  public boolean isUnlocked() {
    return isUnlocked;
  }
  
  public boolean hasLock() {
	  return lockKey != null;
  }

  public String getKeyName() {

    if (lockKey == null) {
      return ""; // there is no lock key in the first place, so we return empty name string
    }

    return lockKey.getName();
  }

  public void useKey(Key key) {
    if (key == null) {
      throw new NullPointerException("key value is null!");
    }

    if (lockKey == null) {
      System.out.println("you cant use key here, no lock is here");
      return;
    }

    close(); // make sure to close the door if it was opened, so the key get tested

    if (lockKey.equalToUse(key)) {
      if (isUnlocked) {
        lock();
      } else {
        unlock();
      }
    } else {
      System.out.println("This is not a usable key for this Lockable!");
    }
  }

  @Override
  public void open() {
    if (!isUnlocked()) {
      System.out.println(lockKey.getName() + " key required to unlock");
    } else {
      super.open();
    }
  }

  private void unlock() {
    isUnlocked = true;
  }

  private void lock() {
    isUnlocked = false;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    Lockable lockable = (Lockable) o;
    return isUnlocked == lockable.isUnlocked && lockKey.equals(lockable.lockKey);
  }

  @Override
  public int hashCode() {
    return Objects.hash(lockKey);
  }
}
