package com.worldNavigator.model.gameSrc.controls.commands;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;

public abstract class Command {

	private DataInputStream in;
	private DataOutputStream out;

	public abstract void execute();

	public abstract String name();

	public Command(DataInputStream in, DataOutputStream out) {
		this.in = in;
		this.out = out;
	}

	private void writeNext() {
		try {
			out.writeUTF("--+");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void readNext() {
		try {
			out.writeUTF("---");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void write(String str) {
		writeNext();
		try {
			out.writeUTF(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public String read() {
		readNext();
		String str = null;
		try {
			str = in.readUTF();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return str;
	}
}
