package cat.institutmarianao.model;

import java.util.Objects;

import jakarta.validation.constraints.NotBlank;

public class Cycle {

	@NotBlank
	private String code;

	@NotBlank
	private String name;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public int hashCode() {
		return Objects.hash(code);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (!(obj instanceof Cycle)) {
			return false;
		}
		Cycle other = (Cycle) obj;
		return Objects.equals(code, other.code);
	}

}
