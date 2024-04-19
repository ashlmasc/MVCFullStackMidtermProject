package com.skilldistillery.snowboardswap.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Event {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "event_start")
	private LocalDateTime eventStart;
	
	private String description;
	
	@CreationTimestamp
	@Column(name = "created_at")
	private LocalDateTime createdAt;
	
    private boolean active;
    
    @Column(name = "updated_at")
	private LocalDateTime updatedAt;
    
    @Column(name = "location_description")
    private String locationDescription;
    
    private String name;
    
    @Column(name = "event_end")
    private LocalDateTime eventEnd;
    
    @Column(name = "image_url")
    private String imageUrl;
    
    //FK: user_id INT
    
    //FK: event_type_id INT
      
    //FK: address_id INT
    
	public Event() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDateTime getEventStart() {
		return eventStart;
	}

	public void setEventStart(LocalDateTime eventStart) {
		this.eventStart = eventStart;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}

	public String getLocationDescription() {
		return locationDescription;
	}

	public void setLocationDescription(String locationDescription) {
		this.locationDescription = locationDescription;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public LocalDateTime getEventEnd() {
		return eventEnd;
	}

	public void setEventEnd(LocalDateTime eventEnd) {
		this.eventEnd = eventEnd;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
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
		Event other = (Event) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Event [id=" + id + ", eventStart=" + eventStart + ", description=" + description + ", createdAt="
				+ createdAt + ", active=" + active + ", updatedAt=" + updatedAt + ", locationDescription="
				+ locationDescription + ", name=" + name + ", eventEnd=" + eventEnd + ", imageUrl=" + imageUrl + "]";
	}
}
