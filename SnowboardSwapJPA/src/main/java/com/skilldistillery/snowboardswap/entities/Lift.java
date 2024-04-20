package com.skilldistillery.snowboardswap.entities;

import java.util.Objects;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

@Entity
public class Lift {

	public Lift() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;
	
	@ManyToOne
	@JoinColumn(name = "lift_type_id")
	private LiftType liftType;
	
	@OneToMany(mappedBy = "lift") 
    private List<LiftStatus> statuses;

////////////////////////////////////////////////////////////////////////////////////////

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

////////////////////////////////////////////////////////////////////////////////////////

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

////////////////////////////////////////////////////////////////////////////////////////

	public LiftType getLiftType() {
		return liftType;
	}

	public void setLiftType(LiftType liftType) {
		this.liftType = liftType;
	}

	public List<LiftStatus> getStatuses() {
		return statuses;
	}

	public void setStatuses(List<LiftStatus> statuses) {
		this.statuses = statuses;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		Lift other = (Lift) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Lift [id=" + id + ", name=" + name + "]";
	}

}
