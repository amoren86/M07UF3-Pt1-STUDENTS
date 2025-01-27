package cat.institutmarianao.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import cat.institutmarianao.model.Cycle;
import jakarta.ejb.Local;

@Local
public interface CycleDao {

	List<Cycle> findAll() throws ClassNotFoundException, SQLException, IOException;
}
