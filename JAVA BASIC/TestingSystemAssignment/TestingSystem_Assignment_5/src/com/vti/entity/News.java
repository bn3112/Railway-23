package com.vti.entity;

import java.util.Arrays;

public class News implements INews {
int ID;
private String title;
private String publishDate;
private String author;
private String content;
private float averageRate;
int[] rate;
public News(int[] rate) {
	this.rate=rate;
}
public News(float averageRate) {
	this.averageRate=averageRate;
}
public News(int ID,String title,String publishDate,String author,String content,int[] rate) {
	this.ID=ID;
	this.title=title;
	this.publishDate=publishDate;
	this.author=author;
	this.content=content;
	this.rate=rate;
}
public News(int ID,String title,String publishDate,String author,String content) {
	this.ID=ID;
	this.title=title;
	this.publishDate=publishDate;
	this.author=author;
	this.content=content;
	
}
public int[] getRate() {
	return rate;
}
public void setRate(int[] rate) {
	this.rate = rate;
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
	System.out.println("Title: "+title +"\nPublishDate: " +publishDate +"\nAuthor: "+author +"\nContent: "+content +"\nAverageRate: " +averageRate);
}
// tao method Calculate ep kieu int-> float
@Override
public float Calculate() {
averageRate = (float)((rate[1]+rate[2]+rate[3])/3);
	return averageRate;
}
@Override
public String toString() {
	return "News [ID=" + ID + ", title=" + title + ", publishDate=" + publishDate + ", author=" + author + ", content="
			+ content + ", averageRate=" + averageRate + ", rate=" + Arrays.toString(rate) + "]";
}

}
