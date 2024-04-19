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
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	
	private String username;
	
	
	private String password;
	
	private Boolean enabled;
	
	private String role;

	@CreationTimestamp
	@Column(name = "create_at")
	private LocalDateTime createdAt;

	
	@CreationTimestamp
	@Column(name = "updated_at")
	private LocalDateTime updatedAt;
	
	
	@Column(name= "first_name")
	private String firstName;
	
	@Column(name= "last_name")
	private String lastName;
	
	private String bio;
	
	
	@Column(name= "address_id")
	private int addressId;
	
	
	@Column(name= "image_url")
	private String imageUrl;
	
	
	@Column(name= "address_id1")
	private int AddressId1;
	
	public User() {}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public LocalDateTime getCreatedAt() {
		return createdAt;
	}


	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}


	public Boolean getEnabled() {
		return enabled;
	}


	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}
	


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}


	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}


	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getBio() {
		return bio;
	}


	public void setBio(String bio) {
		this.bio = bio;
	}


	public int getAddressId() {
		return addressId;
	}


	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}


	public String getImageUrl() {
		return imageUrl;
	}


	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}


	public int getAddressId1() {
		return AddressId1;
	}


	public void setAddressId1(int addressId1) {
		AddressId1 = addressId1;
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
		User other = (User) obj;
		return id == other.id;
	}


	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", enabled=" + enabled
				+ ", role=" + role + ", createdAt=" + createdAt + ", updatedAt=" + updatedAt + ", firstName="
				+ firstName + ", lastName=" + lastName + ", bio=" + bio + ", addressId=" + addressId + ", imageUrl="
				+ imageUrl + ", AddressId1=" + AddressId1 + "]";
	}


	
	
	
	
	
}
