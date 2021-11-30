package com.vti.academy;

import java.util.Objects;

public class Department {
@Override
	public String toString() {
		return "Department [id=" + id + ", name=" + name + "]";
	}
byte id;
String name;
Department departments;
public boolean isNameEqualTo(String target) {
	return this.name.equals(target);
}

@Override
public boolean equals(Object obj) {
	String objName = ((Department) obj).name;
	return name.equals(objName);
}


}
