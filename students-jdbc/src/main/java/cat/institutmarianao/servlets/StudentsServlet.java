package cat.institutmarianao.servlets;

import java.io.IOException;
import java.sql.SQLException;

import cat.institutmarianao.dao.CycleDao;
import cat.institutmarianao.dao.StudentDao;
import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StudentsServlet
 */
@WebServlet(urlPatterns = "/students")
public class StudentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	private CycleDao cyclesDao;

	@EJB
	private StudentDao studentDao;

	@Override
	public void init(ServletConfig config) throws ServletException {
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setAttribute("cycles", cyclesDao.findAll());
			request.setAttribute("students", studentDao.findAll());
			RequestDispatcher dispatcher = request.getRequestDispatcher("/students.jsp");
			dispatcher.forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			throw new ServletException(e);
		}
	}
}
