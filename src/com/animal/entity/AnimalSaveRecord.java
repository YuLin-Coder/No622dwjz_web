package com.animal.entity;

/**
 * 宠物领养记录表实体类
 * @author han
 *
 */
public class AnimalSaveRecord {
	
	private Integer lyid;
	private String animal_id;
	private String user_id;
	private String createTime;
	public Integer getLyid() {
		return lyid;
	}
	public void setLyid(Integer lyid) {
		this.lyid = lyid;
	}
	public String getAnimal_id() {
		return animal_id;
	}
	public void setAnimal_id(String animal_id) {
		this.animal_id = animal_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	private String type;
	


}
