package com.adnan.zohobooks;

public class Item {
	public Item() {
	}

	public Item(String itemID, double rate, String name) {
		this.itemID = itemID;
		this.rate = rate;
		this.name = name;

	}

	private String itemID = "";
	private double rate = 0;
	private double quantity = 0;
	private String name = "";

	public Item(Item item) {
		itemID = item.getItemID();
		name = item.getName();
		
		rate = getRate();
		quantity = getQuantity();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getQuantity() {
		return quantity;
	}

	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public String getItemID() {
		return itemID;
	}

	public void setItemID(String itemID) {
		this.itemID = itemID;
	}

	@Override
	public String toString() {
		return name;
	}

}
