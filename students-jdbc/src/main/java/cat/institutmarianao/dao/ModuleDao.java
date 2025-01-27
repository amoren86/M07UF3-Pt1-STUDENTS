package cat.institutmarianao.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import cat.institutmarianao.model.Module;
import jakarta.ejb.Local;

@Local
public interface ModuleDao {

	Module findByPk(String moduleCode, String cycleCode) throws ClassNotFoundException, SQLException, IOException;

	List<Module> findAllByCycleCode(String cycleCode) throws ClassNotFoundException, SQLException, IOException;
}
