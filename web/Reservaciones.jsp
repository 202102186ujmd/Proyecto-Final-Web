<%-- 
    Document   : Administrador
    Created on : 24 may 2024, 18:03:49
    Author     : Pedro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Website - www.codingnepalweb.com -->
<html lang="en" dir="ltr">
    <head>
        <title>Administrador</title>
        <link rel="stylesheet" href="CSS/Reservas.css" />
        <!-- Boxicons CDN Link -->
        <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body>
        <div class="sidebar">
            <div class="logo-details">
                <i class='bx bxs-hotel'></i>
                <div class="logo_name">Adminsitrador de hotel</div>
                <i class="bx bx-menu" id="btn"></i>
            </div>
            <ul class="nav-list">
                <li>
                    <i class="bx bx-search"></i>
                    <input type="text" placeholder="Search..." />
                    <span class="tooltip">Search</span>
                </li>
                <li>
                    <a href="PagPrincipal.jsp">
                        <i class="bx bx-grid-alt"></i>
                        <span class="links_name">Dashboard</span>
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
                    <a href="#">
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
                <li>
                    <a href="#">
                        <i class="bx bx-cog"></i>
                        <span class="links_name">Setting</span>
                    </a>
                    <span class="tooltip">Setting</span>
                </li>
                <li class="profile">
                    <div class="profile-details">
                        <img src="img/roboto.png" alt="profileImg" />
                        <div class="name_job">
                            <div class="name">Pedro Navarrete</div>
                            <div class="job">Administrador</div>
                        </div>
                    </div>
                    <i class="bx bx-log-out" id="log_out"></i>
                </li>
            </ul>
        </div>
        <section class="home-section">
            <div class="text">Dashboard</div>
            <!-- Aqui debes poner el cambio para la pagina principal -->
            <div>
                <p>Esta es la Pagina Principal</p>
                <table class="user-table">
                    <thead>
                        <tr>
                            <th>ID Reserva</th>
                            <th>ID Cliente</th>
                            <th>ID Habitación</th>
                            <th>Fecha Inicio</th>
                            <th>Fecha Fin</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Aquí se debe iterar sobre la lista de reservaciones y mostrar cada una en una fila de la tabla -->
                    <c:forEach var="reserva" items="${requestScope.lstReservas}">
                        <tr>
                            <td>${reserva.getIdreserva()}</td>
                            <td>${reserva.getIdcliente()}</td>
                            <td>${reserva.getIdhabitacion()}</td>
                            <td>${reserva.getFecha_inicio()}</td>
                            <td>${reserva.getFecha_fin()}</td>
                            <td>${reserva.getEstado()}</td>
                            <td>
                                <button class="button">Editar</button>
                                <button class="button">Eliminar</button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>

        <script>
            let sidebar = document.querySelector(".sidebar");
            let closeBtn = document.querySelector("#btn");
            let searchBtn = document.querySelector(".bx-search");

            closeBtn.addEventListener("click", () => {
                sidebar.classList.toggle("open");
                menuBtnChange();//calling the function(optional)
            });

            searchBtn.addEventListener("click", () => { // Sidebar open when you click on the search iocn
                sidebar.classList.toggle("open");
                menuBtnChange(); //calling the function(optional)
            });

            // following are the code to change sidebar button(optional)
            function menuBtnChange() {
                if (sidebar.classList.contains("open")) {
                    closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");//replacing the iocns class
                } else {
                    closeBtn.classList.replace("bx-menu-alt-right", "bx-menu");//replacing the iocns class
                }
            }

        </script>

    </body>
</html>
