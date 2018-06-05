package com.lgeek.app.model;

public class Secretsecurity {

	public String u_id;
	public String question1;
	public String question2;
	public String question3;
	public String answer1;
	public String answer2;
	public String answer3;

	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getQuestion1() {
		return question1;
	}
	public void setQuestion1(String question1) {
		this.question1 = question1;
	}
	public String getQuestion2() {
		return question2;
	}
	public void setQuestion2(String question2) {
		this.question2 = question2;
	}
	public String getQuestion3() {
		return question3;
	}
	public void setQuestion3(String question3) {
		this.question3 = question3;
	}
	public String getAnswer1() {
		return answer1;
	}
	public void setAnswer1(String answer1) {
		this.answer1 = answer1;
	}
	public String getAnswer2() {
		return answer2;
	}
	public void setAnswer2(String answer2) {
		this.answer2 = answer2;
	}
	public String getAnswer3() {
		return answer3;
	}
	public void setAnswer3(String answer3) {
		this.answer3 = answer3;
	}
	public Secretsecurity(String u_id, String question1, String question2, String question3, String answer1,
			String answer2, String answer3) {
		super();
		this.u_id = u_id;
		this.question1 = question1;
		this.question2 = question2;
		this.question3 = question3;
		this.answer1 = answer1;
		this.answer2 = answer2;
		this.answer3 = answer3;
	}
	public Secretsecurity() {
		super();
	}
	
}
