package com.vti.entity;

	public enum PositionName {
		POSITION_DEV("Dev"), 
		POSITION_TEST("Test"),
		POSITION_SCRUM_MASTER("Scrum Master"),
		POSITION_PM("PM");

		private String positionName;

		PositionName(String positionName) {
			this.positionName = positionName;
		}

		public String getPositionName() {
			return positionName;
		}
	}


