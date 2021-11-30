package com.vti.backend;

import java.time.LocalDate;

import com.vti.academy.Account;
import com.vti.academy.Position;
import com.vti.academy.PositionName;

public class Exercise3_Access_Modifier {
	public static void main(String[] args) {
		question1();
	}
/*Question 1: private access modifier
Thay đổi access modifier và tạo getter/ setter của những class trong
package entity, frontend, backend cho phù hợp
Gợi ý:
o Các class trong package entity thì để access modifier của
property là private và tạo getter, setter cho từng property.
o Các method là các question ở package back-end sẽ để là public
để các class ở frontend có thể gọi được (không để static).*/
	public static void question1() {

		Position position1 = new Position();
		position1.id = 1;
		position1.name = PositionName.POSITION_DEV.getPositionName();
		Position position2 = new Position();
		position2.id = 2;
		position2.name = PositionName.POSITION_TEST.getPositionName();
		Account acc4 = new Account((short) 4, "anhtuyet@gmail.com", "anhtuyet", "Cao", "Tuyet", position2,
				LocalDate.of(2021, 11, 26));
		System.out.println("Exercise 3 Question1: " 
				+ "\nEmail: " + acc4.getEmail()
				+ "\nUsername: " +acc4.getUserName()
				+"\nFirst name: "+acc4.getFirstName()
				+"\nLast name"+ acc4.getLastName()
				+"\nFullName "+acc4.getFullName()
				+"\nPosition: "+ acc4.getPosition().name
				+"\nCreate Date: "+acc4.createDate
				);
	}
}
