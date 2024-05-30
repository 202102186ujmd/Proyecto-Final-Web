
package Controlador;


import DTO.Habitaciones;
import DTO.Usuario;
import Servicios.wsUsuarioAuth;
import Servicios.wshabitacionAuth;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Pedro
 */
@WebServlet(name = "CtrlUsuario", urlPatterns = {"/CtrlUsuario"})
public class CtrlHabitaciones extends HttpServlet {

protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
             HttpSession temp = request.getSession();
            String token = temp.getAttribute("token").toString();
            if(token !=null){
                
                wshabitacionAuth wsUSer = new  wshabitacionAuth();
                try{
                    List<Habitaciones> lst = wsUSer.consultar(token);
                    request.setAttribute("lstUsuario", lst);
                    RequestDispatcher rd = request.getRequestDispatcher("Usuarios.jsp");
                    rd.forward(request, response);
                    
                }
                catch(Exception ex){
                    System.out.println("Erro" + ex.getMessage());
                }
            }
            else{
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
        return "Short description";
    }
}
