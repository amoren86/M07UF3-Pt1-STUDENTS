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
	private String dbProperties;

	public Connection getConnection() throws IOException, ClassNotFoundException, SQLException {
		Properties props = new Properties();
		InputStream resourceAsStream = null;
		Connection con = null;
		ClassLoader classLoader = getClass().getClassLoader();
		URL urlResource = classLoader.getResource(dbProperties);
		if (urlResource != null) {
			resourceAsStream = urlResource.openStream();
			props.load(resourceAsStream);
			Class.forName(props.getProperty("DB_DRIVER_CLASS"));
			con = DriverManager.getConnection(props.getProperty("DB_URL"), props.getProperty("DB_USERNAME"),
					props.getProperty("DB_PASSWORD"));
		}
		if (resourceAsStream != null) {
			resourceAsStream.close();
		}
		return con;
	}
}
