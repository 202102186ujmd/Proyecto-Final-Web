<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Reservación</title>
    <link rel="stylesheet" href="CSS/EditarReservacion.css" />
</head>
<body>
    <div class="container">
        <h1>Editar Reservación</h1>
        <form action="CtrlReservaciones" method="post">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="idreserva" value="${reserva.idreserva}">
            <label for="idcliente">ID Cliente:</label>
            <input type="number" name="idcliente" id="idcliente" value="${reserva.idcliente}" required><br>
            <label for="idhabitacion">ID Habitación:</label>
            <input type="number" name="idhabitacion" id="idhabitacion" value="${reserva.idhabitacion}" required><br>
            <label for="fecha_inicio">Fecha Inicio:</label>
            <input type="date" name="fecha_inicio" id="fecha_inicio" value="${reserva.fecha_inicio}" required><br>
            <label for="fecha_fin">Fecha Fin:</label>
            <input type="date" name="fecha_fin" id="fecha_fin" value="${reserva.fecha_fin}" required><br>
            <label for="estado">Estado:</label>
            <select name="estado" id="estado" required>
                <option value="Pendiente" ${reserva.estado == 'Pendiente' ? 'selected' : ''}>Pendiente</option>
                <option value="Confirmada" ${reserva.estado == 'Confirmada' ? 'selected' : ''}>Confirmada</option>
                <option value="Cancelada" ${reserva.estado == 'Cancelada' ? 'selected' : ''}>Cancelada</option>
            </select><br>
            <button type="submit">Guardar</button>
        </form>
        <button class="cancel" onclick="window.location.href='CtrlReservaciones'">Cancelar</button>
    </div>
</body>
</html>
