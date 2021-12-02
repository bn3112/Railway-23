package com.vti.frontend;

import com.vti.backend.Exercise1_Abstraction;
import com.vti.backend.Exercise2_Polymorphism;
import com.vti.entity.News;
import com.vti.entity.Student;

public class Program {
public static void main(String[] args) {
	Exercise1_Abstraction ex1 = new Exercise1_Abstraction();
	News new1 = new News(1, "Corona", "2021/11/30", "Nguyen A", "Corona bung phat lan 2" );
	News new2 = new News(5+6+7);
	

	ex1.addNews(new1);
	ex1.addNews(new2);
	ex1.question1();
	Exercise2_Polymorphism ex2= new Exercise2_Polymorphism();
	//ex2.question1();
	//ex2.question3();
}
}

