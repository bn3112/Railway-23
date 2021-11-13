import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
public class Student {
	public Student() {}
	int id;
	float salary;
	String fullName;
	boolean isPassCourse;
	Date birthDay;
	Gender gender;
	int[] points;

// ham chay chuong trinh 
	public static void main(String[] args) throws ParseException {
		Student student1 = new Student();
		student1.id = 1;
		student1.fullName = "nguyen a";
		student1.salary = 102.201f; // dung f de bieu thi dang chu thap phan
		String date_string = "20-11-1992";
		// Instantiating the SimpleDateFormat class
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		// Parsing the given String to Date object
		Date date = formatter.parse(date_string);
		student1.birthDay = date;
		student1.gender = Gender.FEMALE;
		int arr[] = { 9, 10 };
		student1.points = arr;
		System.out.println("ma sinh vien " + student1.id + "\nluong " + student1.salary);
	}
}
// instance la su the hien cua 1 class = record trong sql 
// dung \n\t de xuong dong va tab
// doi ten chuot phai refactor -> rename
