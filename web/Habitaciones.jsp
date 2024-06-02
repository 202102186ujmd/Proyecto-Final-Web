<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <title>Administrador</title>
        <link rel="stylesheet" href="CSS/Habitaciones.css" />
        <!-- Boxicons CDN Link -->
        <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body>
        <div class="sidebar">
            <div class="logo-details">
                <i class='bx bxs-hotel'></i>
                <div class="logo_name">Administrador de hotel</div>
                <i class="bx bx-menu" id="btn"></i>
            </div>
            <ul class="nav-list">
                <li>
                    <a href="PagPrincipal.jsp">
                        <i class="bx bx-grid-alt"></i>
                        <span class="links_name">Pagina Principal</span>
                    </a>
                    <span class="tooltip">Dashboard</span>
                </li>
                <li>
                    <a href="CtrlClientes">
                        <i class="bx bx-user"></i>
                        <span class="links_name">Clientes</span>
                    </a>
                    <span class="tooltip">Clientes</span>
                </li>
                <li>
                    <a href="CtrlUsuario">
                        <i class="bx bx-user"></i>
                        <span class="links_name">Usuarios</span>
                    </a>
                    <span class="tooltip">Usuarios</span>
                </li>
                <li>
                    <a href="CtrlHabitaciones">
                        <i class="bx bx-bed"></i>
                        <span class="links_name">Habitaciones</span>
                    </a>
                    <span class="tooltip">Habitaciones</span>
                </li>
                <li>
                    <a href="CtrlReservaciones">
                        <i class='bx bx-book-add'></i>
                        <span class="links_name">Reservaciones</span>
                    </a>
                    <span class="tooltip">Reservaciones</span>
                </li>
                <li class="profile">
                    <div class="profile-details">
                        <img src="img/roboto.png" alt="profileImg" />
                        <div class="name_job">
                            <div class="name">Pedro Navarrete</div>
                            <div class="job">Administrador</div>
                        </div>
                    </div>
                    <a href="CtrlLogin?accion=cerrarSesion">
                        <i class="bx bx-log-out" id="log_out"></i>
                    </a>
                </li>
            </ul>
        </div>
        <section class="home-section">
            <div class="text">Gestión de Habitaciones</div>

            <!-- Tabla para mostrar las habitaciones -->
            <table class="user-table">
                <thead>
                    <tr>
                        <th>ID Habitación</th>
                        <th>Tipo de Habitación</th>
                        <th>Precio por Noche</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="habitacion" items="${requestScope.lstHabitaciones}">
                        <tr>
                            <td>${habitacion.idhabitaion}</td>
                            <td>${habitacion.typehabitacion}</td>
                            <td>${habitacion.precioxnoche}</td>
                            <td>${habitacion.estado}</td>
                            <td>
                                <button class="button" onclick="window.location.href = 'CtrlHabitaciones?action=showEditForm&idhabitaion=${habitacion.idhabitaion}'">Editar</button>
                                <form action="CtrlHabitaciones" method="post" style="display:inline;" onsubmit="return confirm('¿Estás seguro de que deseas eliminar esta habitación?');">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="idhabitaion" value="${habitacion.idhabitaion}">
                                    <button type="submit" class="button">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div>
                <!-- Botón para mostrar el formulario de nueva habitación -->
                <button id="btnNuevaHabitacion" class="button">Nueva Habitación</button>
            </div>

            <!-- Formulario para agregar una nueva habitación -->
            <div id="formNuevaHabitacion" class="form-container" style="display:none;">
                <h2>Agregar Nueva Habitación</h2>
                <form action="CtrlHabitaciones" method="post">
                    <input type="hidden" name="action" value="add">
                    <label for="typehabitacion">Tipo de Habitación:</label>
                    <input type="text" id="typehabitacion" name="typehabitacion" required>
                    <label for="precioxnoche">Precio por Noche:</label>
                    <input type="number" step="0.01" id="precioxnoche" name="precioxnoche" required>
                    <label for="estado">Estado:</label>
                    <input type="text" id="estado" name="estado" required>
                    <button type="submit">Agregar Habitación</button>
                </form>
                <button id="btnCancelarNueva" class="button cancel">Cancelar</button>
            </div>

            <!-- Formulario para editar una habitación -->
            <c:if test="${requestScope.habitacion != null}">
                <div id="formEditarHabitacion" class="form-container">
                    <h2>Editar Habitación</h2>
                    <form action="CtrlHabitaciones" method="post">
                        <input type="hidden" name="action" value="edit">
                        <input type="hidden" name="idhabitaion" value="${habitacion.idhabitaion}">
                        <label for="typehabitacion">Tipo de Habitación:</label>
                        <input type="text" id="typehabitacion" name="typehabitacion" value="${habitacion.typehabitacion}" required>
                        <label for="precioxnoche">Precio por Noche:</label>
                        <input type="number" step="0.01" id="precioxnoche" name="precioxnoche" value="${habitacion.precioxnoche}" required>
                        <label for="estado">Estado:</label>
                        <input type="text" id="estado" name="estado" value="${habitacion.estado}" required>
                        <button type="submit">Guardar</button>
                    </form>
                    <button id="btnCancelarEditar" class="button cancel">Cancelar</button>
                </div>
            </c:if>
        </section>

        <script>
            let sidebar = document.querySelector(".sidebar");
            let closeBtn = document.querySelector("#btn");
            let searchBtn = document.querySelector(".bx-search");

            closeBtn.addEventListener("click", () => {
                sidebar.classList.toggle("open");
                menuBtnChange();//calling the function(optional)
            });

            searchBtn.addEventListener("click", () => { // Sidebar open when you click on the search icon
                sidebar.classList.toggle("open");
                menuBtnChange(); //calling the function(optional)
            });

            // following are the code to change sidebar button(optional)
            function menuBtnChange() {
                if (sidebar.classList.contains("open")) {
                    closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");//replacing the icons class
                } else {
                    closeBtn.classList.replace("bx-menu-alt-right", "bx-menu");//replacing the icons class
                }
            }

            // JavaScript para manejar la visibilidad del formulario de nueva habitación
            document.getElementById("btnNuevaHabitacion").addEventListener("click", function () {
                document.getElementById("formNuevaHabitacion").style.display = "block";
            });

            document.getElementById("btnCancelarNueva").addEventListener("click", function () {
                document.getElementById("formNuevaHabitacion").style.display = "none";
            });

            // JavaScript para manejar la visibilidad del formulario de editar habitación
            document.getElementById("btnCancelarEditar").addEventListener("click", function () {
                document.getElementById("formEditarHabitacion").style.display = "none";
            });
        </script>
    </body>
</html>
