package com.stars.entity;

public class Forum {
	private int id;
	private String name;
	private String introduction;
	private int views;
	private String urlView;
	private String urlAfter;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getUrlView() {
		return urlView;
	}

	public void setUrlView(String urlView) {
		this.urlView = urlView;
	}

	public String getUrlAfter() {
		return urlAfter;
	}

	public void setUrlAfter(String urlAfter) {
		this.urlAfter = urlAfter;
	}


}
