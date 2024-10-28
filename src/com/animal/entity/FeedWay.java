package com.animal.entity;

/*
 * 喂养方式实体类
 */
public class FeedWay {
	
	private Integer id ;
	private String animal_name;
	private String wyfs ;
	private Integer animal_id;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAnimal_name() {
		return animal_name;
	}
	public void setAnimal_name(String animal_name) {
		this.animal_name = animal_name;
	}
	public String getWyfs() {
		return wyfs;
	}
	public void setWyfs(String wyfs) {
		this.wyfs = wyfs;
	}
	public Integer getAnimal_id() {
		return animal_id;
	}
	public void setAnimal_id(Integer animal_id) {
		this.animal_id = animal_id;
	}
	
	

}
