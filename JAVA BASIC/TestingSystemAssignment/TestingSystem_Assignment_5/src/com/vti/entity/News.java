package com.vti.entity;

import java.util.Arrays;

public class News implements INews {
	int ID;
	private String title;
	private String publishDate;
	private String author;
	private String content;
	private float averageRate;
	int[] rates;

	public News(int[] rate) {
		this.rates = rate;
	}

	public News(float averageRate, String title, String publishDate, String author, String content, int[] rates) {
		this.averageRate = averageRate;
		this.title = title;
		this.publishDate = publishDate;
		this.author = author;
		this.content = content;
		this.rates = rates;
	}

	public News(String title, String publishDate, String author, String content, int[] rates) {
		this.title = title;
		this.publishDate = publishDate;
		this.author = author;
		this.content = content;
		this.rates = rates;
	}

	public News(int ID, String title, String publishDate, String author, String content) {
		this.ID = ID;
		this.title = title;
		this.publishDate = publishDate;
		this.author = author;
		this.content = content;

	}

	public int[] getRate() {
		return rates;
	}

	public void setRate(int[] rates) {
		this.rates = rates;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public float getAverageRate() {
		return averageRate;
	}

	@Override
	public void Display() {
		System.out.println("Title: " + this.title + "\nPublishDate: " + this.publishDate + "\nAuthor: " + this.author
				+ "\nContent: " + this.content + "\nAverageRate: " + this.averageRate);
	}

// tao method Calculate ep kieu int-> float
	@Override
	public void Calculate() {
		if (this.rates != null) {
			float averageRate =  (this.rates[0]+this.rates[1]+this.rates[2])/3;
			this.averageRate = averageRate;
		}
	}

	@Override
	public String toString() {
		return "News [ID=" + ID + ", title=" + title + ", publishDate=" + publishDate + ", author=" + author
				+ ", content=" + content + ", averageRate=" + averageRate + ", rates=" + Arrays.toString(rates) + "]";
	}

}
