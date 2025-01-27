package cat.institutmarianao.model;

import java.util.Objects;

import jakarta.validation.constraints.NotBlank;

public class Module {

	@NotBlank
	private String code;

	@NotBlank
	private String cycleCode;

	@NotBlank
	private String name;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCycleCode() {
		return cycleCode;
	}

	public void setCycleCode(String cycle) {
		cycleCode = cycle;
	}

	public String getName() {
		return name;
	}

	public void setName(String module) {
		name = module;
	}

	@Override
	public int hashCode() {
		return Objects.hash(code, cycleCode);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (!(obj instanceof Module)) {
			return false;
		}
		Module other = (Module) obj;
		return Objects.equals(code, other.code) && Objects.equals(cycleCode, other.cycleCode);
	}

}
