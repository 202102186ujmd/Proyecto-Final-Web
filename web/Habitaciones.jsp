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

        <!-- Botón para mostrar el formulario de agregar nueva habitación -->
        <button class="button" onclick="toggleForm('form-container')">Agregar Nueva Habitación</button>

        <!-- Formulario para agregar una nueva habitación -->
        <div class="form-container" id="form-container" style="display:none;">
            <h2>Agregar Nueva Habitación</h2>
            <form action="CtrlHabitaciones" method="post">
                <input type="hidden" name="action" value="add">
                <label for="typehabitacion">Tipo de Habitación:</label>
                <input type="text" id="typehabitacion" name="typehabitacion" required>
                <label for="precioxnoche">Precio por Noche:</label>
                <input type="number" step="0.01" id="precioxnoche" name="precioxnoche" required>
                <label for="estado">Estado:</label>
                <input type="text" id="estado" name="estado" required>
                <div>
                    <button type="submit" class="button">Agregar Habitación</button>
                    <button type="button" class="button cancel" onclick="toggleForm('form-container')">Cancelar</button>
                </div>
            </form>
        </div>

        <!-- Tabla para mostrar las habitaciones -->
        <div class="table-container">
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
                            <td>${habitacion.idhabitacion}</td>
                            <td>${habitacion.typehabitacion}</td>
                            <td>${habitacion.precioxnoche}</td>
                            <td>${habitacion.estado}</td>
                            <td>
                                <button class="button" onclick="window.location.href = 'CtrlHabitaciones?action=showEditForm&idhabitacion=${habitacion.idhabitacion}'">Editar</button>
                                <form action="CtrlHabitaciones" method="post" style="display:inline;" onsubmit="return confirm('¿Estás seguro de que deseas eliminar esta habitación?');">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="idhabitacion" value="${habitacion.idhabitacion}">
                                    <button type="submit" class="button delete">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Formulario para editar una habitación -->
        <c:if test="${requestScope.habitacion != null}">
            <div class="form-container" id="formEditarHabitacion" style="display:block;">
                <h2>Editar Habitación</h2>
                <form action="CtrlHabitaciones" method="post">
                    <input type="hidden" name="action" value="edit">
                    <input type="hidden" name="idhabitacion" value="${habitacion.idhabitacion}">
                    <label for="typehabitacion">Tipo de Habitación:</label>
                    <input type="text" id="typehabitacion" name="typehabitacion" value="${habitacion.typehabitacion}" required>
                    <label for="precioxnoche">Precio por Noche:</label>
                    <input type="number" step="0.01" id="precioxnoche" name="precioxnoche" value="${habitacion.precioxnoche}" required>
                    <label for="estado">Estado:</label>
                    <input type="text" id="estado" name="estado" value="${habitacion.estado}" required>
                    <div>
                        <button type="submit" class="button">Guardar</button>
                        <button type="button" class="button cancel" onclick="toggleForm('formEditarHabitacion')">Cancelar</button>
                    </div>
                </form>
            </div>
        </c:if>
    </section>

    <script>
        function toggleForm(formId) {
            var formContainer = document.getElementById(formId);
            if (formContainer.style.display === "none" || formContainer.style.display === "") {
                formContainer.style.display = "block";
            } else {
                formContainer.style.display = "none";
                clearForm(formContainer);
            }
        }

        function clearForm(formContainer) {
            var inputs = formContainer.getElementsByTagName('input');
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].type === "text" || inputs[i].type === "number") {
                    inputs[i].value = "";
                }
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
