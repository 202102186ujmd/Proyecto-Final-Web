package Controlador;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "CtrlReserva", urlPatterns = {"/CtrlReserva"})
public class CtrlReserva extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession temp = request.getSession();
            String token = (String) temp.getAttribute("token");
           
            if (token != null) {
                String accion = request.getParameter("accion");
                RequestDispatcher rd = request.getRequestDispatcher("Hotel.jsp");
                if ("1".equals(accion)) {
                    int habitacion = Integer.parseInt(request.getParameter("idhabitacion"));
                    String fechaInicio = request.getParameter("fecha_inicio");
                    String fechaFin = request.getParameter("fecha_fin");
                    String estado = request.getParameter("estado");

                    // Aquí puedes agregar la lógica para guardar la reserva en la base de datos

                    // Redirigir a la página de confirmación
                    request.setAttribute("mensaje", "Reservación realizada con éxito");
                   
                    rd.forward(request, response);
                } else {
                    // Acción no reconocida
                    request.setAttribute("mensaje", "Acción no reconocida");
                    rd.forward(request, response);
                }
            } else {
                System.out.println("Final");
                response.sendRedirect("CtrlLogin");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "CtrlReserva Servlet";
    }
}
