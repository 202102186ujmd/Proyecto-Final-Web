<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <title>Administrador</title>
    <link rel="stylesheet" href="CSS/Reservaciones.css" />
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
        <div class="text">Gestión de Reservaciones</div>

        <!-- Tabla para mostrar las reservaciones -->
        <table class="user-table">
            <thead>
                <tr>
                    <th>ID Reservación</th>
                    <th>ID Cliente</th>
                    <th>ID Habitación</th>
                    <th>Fecha Inicio</th>
                    <th>Fecha Fin</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="reservaciones" items="${requestScope.lstReservaciones}">
                    <tr>
                        <td>${reservaciones.idreserva}</td>
                        <td>${reservaciones.idcliente}</td>
                        <td>${reservaciones.idhabitacion}</td>
                        <td>${reservaciones.fecha_inicio}</td>
                        <td>${reservaciones.fecha_fin}</td>
                        <td>${reservaciones.estado}</td>
                        <td>
                            <button class="button" onclick="window.location.href='CtrlReservaciones?action=showEditForm&idreserva=${reservaciones.idreserva}'">Editar</button>
                            <form action="CtrlReservaciones" method="post" style="display:inline;" onsubmit="return confirm('¿Estás seguro de que deseas eliminar esta reservación?');">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="idreserva" value="${reservaciones.idreserva}">
                                <button type="submit" class="button">Eliminar</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div>
            <!-- Botón para mostrar el formulario de nueva reservación -->
            <button id="btnNuevaReservacion" class="button" onclick="window.location.href='CtrlReservaciones?action=showAddForm'">Nueva Reservación</button>
        </div>
    </section>

    <script>
        let sidebar = document.querySelector(".sidebar");
        let closeBtn = document.querySelector("#btn");
        let searchBtn = document.querySelector(".bx-search");

        closeBtn.addEventListener("click", () => {
            sidebar.classList.toggle("open");
            menuBtnChange();
        });

        searchBtn.addEventListener("click", () => {
            sidebar.classList.toggle("open");
            menuBtnChange();
        });

        function menuBtnChange() {
            if (sidebar.classList.contains("open")) {
                closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");
            } else {
                closeBtn.classList.replace("bx-menu-alt-right", "bx-menu");
            }
        }
    </script>
</body>
</html>
