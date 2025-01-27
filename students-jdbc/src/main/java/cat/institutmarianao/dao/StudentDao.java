package cat.institutmarianao.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import cat.institutmarianao.model.Student;
import jakarta.ejb.Local;

@Local
public interface StudentDao {

	Student findByPk(String dni) throws ClassNotFoundException, SQLException, IOException;

	List<Student> findAll() throws ClassNotFoundException, SQLException, IOException;

	Student add(Student student) throws ClassNotFoundException, SQLException, IOException;

	void remove(Student student) throws ClassNotFoundException, SQLException, IOException;

	void removeByDni(String dni) throws ClassNotFoundException, SQLException, IOException;
}