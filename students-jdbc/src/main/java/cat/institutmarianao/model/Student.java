package cat.institutmarianao.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

public class Student {

	@NotBlank
	@Pattern(regexp = "[0-9]{7,8}[A-HJ-NP-TV-Za-hj-np-tv-z]", message = "has invalid format. Must be like 12345678X")
	private String dni;

	@NotBlank
	@Size(max = 200)
	private String name;

	@NotBlank
	@Size(max = 200)
	private String surname;

	@Email
	private String email;

	@NotBlank
	private String cycle;

	@NotEmpty
	private List<Module> modules;

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni.toUpperCase();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCycle() {
		return cycle;
	}

	public void setCycle(String cycle) {
		this.cycle = cycle;
	}

	public List<Module> getModules() {
		if (modules == null) {
			modules = new ArrayList<>();
		}
		return modules;
	}

	public void setModules(List<Module> modules) {
		this.modules = modules;
	}

	@Override
	public int hashCode() {
		return Objects.hash(dni);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (!(obj instanceof Student other)) {
			return false;
		}
		return Objects.equals(dni, other.dni);
	}
}
