<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <title>Administrador</title>
        <link rel="stylesheet" href="CSS/Usuario.css" />
        <!-- Boxicons CDN Link -->
        <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <style>
            .form-container {
                display: none; /* Formulario oculto por defecto */
                margin-top: 20px;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 8px;
                background-color: #f9f9f9;
            }

            .toggle-form-btn {
                background-color: #4caf50;
                color: white;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                border-radius: 4px;
                font-size: 14px;
                transition: background-color 0.3s;
            }

            .toggle-form-btn:hover {
                background-color: #45a049;
            }
        </style>
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
            <div class="text">Gestión de Usuarios</div>

            <!-- Botón para mostrar el formulario de agregar nuevo usuario -->
            <button class="toggle-form-btn" onclick="toggleForm()">Agregar Nuevo Usuario</button>

            <!-- Formulario para agregar un nuevo usuario -->
            <div class="form-container" id="form-container">
                <h2>Agregar Nuevo Usuario</h2>
                <form action="CtrlUsuario" method="post">
                    <input type="hidden" name="action" value="add">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" required>
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                    <label for="typeuser">Tipo de Usuario:</label>
                    <input type="number" id="typeuser" name="typeuser" required>
                    <div>
                        <br>
                        <button type="submit" class="toggle-form-btn cancel">Agregar Usuario</button>
                        <button type="button" class="toggle-form-btn cancel" onclick="toggleForm()">Cancelar</button>
                    </div>
                </form>
            </div>

            <!-- Tabla para mostrar los usuarios -->
            <table class="user-table">
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Tipo de Usuario</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="usuario" items="${requestScope.lstUsuario}">
                        <tr>
                            <td>${usuario.username}</td>
                            <td>${usuario.password}</td>
                            <td>${usuario.typeuser}</td>
                            <td>
                                <button class="button" onclick="window.location.href = 'EditarUsuario.jsp?username=${usuario.username}&password=${usuario.password}&typeuser=${usuario.typeuser}'">Editar</button>
                                <form action="CtrlUsuario" method="post" style="display:inline;" onsubmit="return confirm('¿Estás seguro de que deseas eliminar este usuario?');">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="username" value="${usuario.username}">
                                    <button type="submit" class="button">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>

        <script>
            function toggleForm() {
                var formContainer = document.getElementById("form-container");
                if (formContainer.style.display === "none" || formContainer.style.display === "") {
                    formContainer.style.display = "block";
                } else {
                    formContainer.style.display = "none";
                }
            }

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
