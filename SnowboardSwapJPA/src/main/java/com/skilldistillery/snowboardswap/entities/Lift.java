package com.skilldistillery.snowboardswap.entities;

import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

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
