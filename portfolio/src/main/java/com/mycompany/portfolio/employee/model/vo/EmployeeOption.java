package com.mycompany.portfolio.employee.model.vo;

public class EmployeeOption {

	private String codeId;
	private String codeName;
	private int minSal;
	private int maxSal;
	private String optStatus;
	
	public EmployeeOption() {}

	public EmployeeOption(String codeId, String codeName) {
		super();
		this.codeId = codeId;
		this.codeName = codeName;
	}

	public EmployeeOption(String codeId, String codeName, int minSal, int maxSal) {
		super();
		this.codeId = codeId;
		this.codeName = codeName;
		this.minSal = minSal;
		this.maxSal = maxSal;
	}

	public String getCodeId() {
		return codeId;
	}

	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}

	public String getCodeName() {
		return codeName;
	}

	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}

	public int getMinSal() {
		return minSal;
	}

	public void setMinSal(int minSal) {
		this.minSal = minSal;
	}

	public int getMaxSal() {
		return maxSal;
	}

	public void setMaxSal(int maxSal) {
		this.maxSal = maxSal;
	}

	public String getOptStatus() {
		return optStatus;
	}

	public void setOptStatus(String optStatus) {
		this.optStatus = optStatus;
	}

	@Override
	public String toString() {
		return "EmployeeOption [codeId=" + codeId + ", codeName=" + codeName + ", minSal=" + minSal + ", maxSal="
				+ maxSal + ", optStatus=" + optStatus + "]";
	}
	
}
