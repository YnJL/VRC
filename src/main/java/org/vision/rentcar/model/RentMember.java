package org.vision.rentcar.model;

public class RentMember {
	private String id;
	private String pass;
	private String email;
	private String tel;
	private String age;
	private String hobby;
	private String job; 
	
	public RentMember() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RentMember(String id, String pass, String email, String tel, String age, String hobby, String job) {
		super();
		this.id = id;
		this.pass = pass;
		this.email = email;
		this.tel = tel;
		this.age = age;
		this.hobby = hobby;
		this.job = job;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	@Override
	public String toString() {
		return "회원정보 [id=" + id + ", pass=" + pass + ", email=" + email + ", tel=" + tel + ", age=" + age
				+ ", hobby=" + hobby + ", job=" + job + "]";
	}
	
	
	
	
	
}
