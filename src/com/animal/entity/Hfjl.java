package com.animal.entity;

/**
 * 回访记录实体类
 * @author han
 *
 */
public class Hfjl {
	private Integer id;
	private String name;
	private String category;
	private Integer director_id;
	private Integer animal_id;
	private String imgUrl;
	
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public Integer getDirector_id() {
		return director_id;
	}
	public void setDirector_id(Integer director_id) {
		this.director_id = director_id;
	}
	public Integer getAnimal_id() {
		return animal_id;
	}
	public void setAnimal_id(Integer animal_id) {
		this.animal_id = animal_id;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getCondation() {
		return condation;
	}
	public void setCondation(String condation) {
		this.condation = condation;
	}
	public String getHfz() {
		return hfz;
	}
	public void setHfz(String hfz) {
		this.hfz = hfz;
	}
	public String getHfrq() {
		return hfrq;
	}
	public void setHfrq(String hfrq) {
		this.hfrq = hfrq;
	}
	private String director;
	private String condation;
	private String hfz;
	private String hfrq;


	
	
	
	
	
	

}
