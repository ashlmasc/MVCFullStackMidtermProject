package com.skilldistillery.snowboardswap.entities;

import java.util.List;
import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Resort {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String website;

	private String name;
	
	@OneToMany(mappedBy = "resort") 
    private List<Trail> trails;

	public Resort() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Trail> getTrails() {
		return trails;
	}

	public void setTrails(List<Trail> trails) {
		this.trails = trails;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Resort other = (Resort) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Resort [id=" + id + ", website=" + website + ", name=" + name + "]";
	}

	
	
}
