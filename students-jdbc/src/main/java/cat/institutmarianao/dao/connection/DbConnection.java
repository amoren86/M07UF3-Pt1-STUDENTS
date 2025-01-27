package cat.institutmarianao.dao.connection;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import jakarta.annotation.Resource;
import jakarta.ejb.Stateless;

@Stateless
public class DbConnection {
	@Resource(name = "dbProperties")
	private String dbProperties = "db.properties"; // TODO delete assignment and use @Resource

	public Connection getConnection() throws ClassNotFoundException, IOException, SQLException {
		Properties props = new Properties();
		ClassLoader classLoader = getClass().getClassLoader();
		URL urlResource = classLoader.getResource(dbProperties);

		if (urlResource != null) {
			try (InputStream resourceAsStream = urlResource.openStream()) {
				props.load(resourceAsStream);
				Class.forName(props.getProperty("DB_DRIVER_CLASS"));
				return DriverManager.getConnection(props.getProperty("DB_URL"), props.getProperty("DB_USERNAME"),
						props.getProperty("DB_PASSWORD"));
			}
		}

		return null;
	}
}
