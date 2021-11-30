package com.vti.backend;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Scanner;

import com.vti.entity.News;

public class Exercise1_Abstraction {
	private ArrayList<News> listNews;
	private Scanner scanner;

	public Exercise1_Abstraction() {
		listNews = new ArrayList<News>();
		scanner = new Scanner(System.in);
	}
	public void addNews(News new1) {
		this.listNews.add(new1);
	}

	public void question1() {
		menu();
	}

	private void menu() {
		boolean isOk = false;
		while (!isOk) {
			System.out.println("Welcome!!!!");
			System.out.println("Select a option ");
			System.out.println("1. Insert news");
			System.out.println("2. View list news");
			System.out.println("3. Average rate");
			System.out.println("4. Exit");
			int i = scanner.nextInt();
			switch (i) {
			case 1:
				System.out.println("Input ID");
				int ID = scanner.nextInt();
				scanner.nextLine();
				System.out.println("Input Title");
				String title = scanner.nextLine();
				System.out.println("Input PublishDate");
				String publishDate = scanner.nextLine();
				System.out.println("Input Author");
				String author = scanner.nextLine();
				System.out.println("Input Content");
				String content = scanner.nextLine();
				System.out.println("Input Rate 1");
				int rate1 = scanner.nextInt();
				System.out.println("Input Rate 2");
				int rate2 = scanner.nextInt();
				System.out.println("Input Rate 3");
				int rate3 = scanner.nextInt();
				int[] rates = { rate1, rate2, rate3 };
				News news = new News(ID, title, publishDate, author, content, rates);
				listNews.add(news);
				System.out.println("You put in news: " + news.toString());
				isOk = true;
				break;
			case 2:
				for (News addnew : listNews) {
					addnew.Display();
				}
				isOk = true;
				break;
			case 3:
				for (News addnew : listNews)
					addnew.Calculate();
				for (News addnew : listNews)
					addnew.Display();
				isOk = true;
				break;
			case 4:
				System.out.println("Exit!");
				return;

			}
		}
		scanner.close();
	}
}
