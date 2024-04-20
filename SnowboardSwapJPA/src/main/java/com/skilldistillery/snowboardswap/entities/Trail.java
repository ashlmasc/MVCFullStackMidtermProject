package com.skilldistillery.snowboardswap.entities;

import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Trail {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String difficulty;
	
	@Column(name="resort_id")
	private int resortId;
	
	@OneToMany(mappedBy = "trail") 
    private List<TrailStatus> statuses;

	public Trail() {}

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

	public String getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}

	public int getResortId() {
		return resortId;
	}

	public void setResortId(int resortId) {
		this.resortId = resortId;
	}

	public List<TrailStatus> getStatuses() {
		return statuses;
	}

	public void setStatuses(List<TrailStatus> statuses) {
		this.statuses = statuses;
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
		Trail other = (Trail) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Trail [id=" + id + ", name=" + name + ", difficulty=" + difficulty + ", resortId=" + resortId + "]";
	}

	


	
	
	
	

}
