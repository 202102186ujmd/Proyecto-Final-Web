<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Crear Reservación</title>
    <link rel="stylesheet" href="CSS/EditarReservacion.css" />
</head>
<body>
    <div class="container">
        <h1>Crear Nueva Reservación</h1>
        <form action="CtrlReservaciones" method="post">
            <input type="hidden" name="action" value="add">
            <label for="idcliente">ID Cliente:</label>
            <input type="number" name="idcliente" id="idcliente" required><br>
            <label for="idhabitacion">ID Habitación:</label>
            <input type="number" name="idhabitacion" id="idhabitacion" required><br>
            <label for="fecha_inicio">Fecha Inicio:</label>
            <input type="date" name="fecha_inicio" id="fecha_inicio" required><br>
            <label for="fecha_fin">Fecha Fin:</label>
            <input type="date" name="fecha_fin" id="fecha_fin" required><br>
            <label for="estado">Estado:</label>
            <select name="estado" id="estado" required>
                <option value="pendiente" selected>Pendiente</option>
                <option value="cancelada">Cancelada</option>
                <option value="confirmada">Confirmada</option>
            </select><br>
            <button type="submit">Guardar</button>
        </form>
        <button class="cancel" onclick="window.location.href='CtrlReservaciones'">Cancelar</button>
    </div>
</body>
</html>
