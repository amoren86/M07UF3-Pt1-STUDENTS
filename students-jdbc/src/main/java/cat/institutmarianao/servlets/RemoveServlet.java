package cat.institutmarianao.servlets;

import java.io.IOException;
import java.sql.SQLException;

import cat.institutmarianao.dao.StudentDao;
import cat.institutmarianao.model.Student;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RemoveServlet
 */
@WebServlet(urlPatterns = "/remove")
public class RemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	private StudentDao studentDao;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String dni = request.getParameter("dni");
			Student student = new Student();
			student.setDni(dni);
			studentDao.remove(student);
			response.sendRedirect("students");
		} catch (ClassNotFoundException | SQLException e) {
			throw new ServletException(e);
		}
	}

}
