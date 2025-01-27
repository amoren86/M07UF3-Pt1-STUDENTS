package cat.institutmarianao.dao.impl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cat.institutmarianao.dao.connection.DbConnection;
import jakarta.ejb.EJB;

public abstract class BaseDaoImpl<T, V> {
	@EJB
	protected DbConnection dBConnection;
	protected Connection connection;

	public BaseDaoImpl() {
	}

	protected PreparedStatement getPreparedStatement(String query)
			throws ClassNotFoundException, SQLException, IOException {
		if (connection == null) {
			connection = dBConnection.getConnection();
		}
		return connection.prepareStatement(query);
	}

	protected abstract T buildObjectFromResultSet(ResultSet rs) throws SQLException;

	protected List<T> executeQuery(PreparedStatement preparedStatement) throws SQLException {
		List<T> results = new ArrayList<>();

		ResultSet rs = preparedStatement.executeQuery();
		while (rs.next()) {
			T user = buildObjectFromResultSet(rs);
			results.add(user);
		}
		rs.close();
		return results;
	}

	protected T findUniqueResult(PreparedStatement preparedStatement) throws SQLException {
		List<T> results = executeQuery(preparedStatement);
		if (results.isEmpty()) {
			return null;
		}
		if (results.size() > 1) {
			throw new SQLException("Only one result expected");
		}
		return results.get(0);
	}

	protected int executeUpdateQuery(PreparedStatement preparedStatement)
			throws ClassNotFoundException, SQLException, IOException {
		if (connection == null) {
			connection = dBConnection.getConnection();
		}
		return preparedStatement.executeUpdate();
	}
}
