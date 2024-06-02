<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Cliente</title>
    <link rel="stylesheet" href="CSS/EditarCliente.css" />
</head>
<body>
    <div class="container">
        <h1>Editar Cliente</h1>
        <form action="CtrlClientes" method="post">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="id" value="${param.id}">
            <label for="nombre">Nombre:</label>
            <input type="text" name="nombre" id="nombre" value="${param.nombre}" required><br>
            <label for="apellido">Apellido:</label>
            <input type="text" name="apellido" id="apellido" value="${param.apellido}" required><br>
            <label for="email">Email:</label>
            <input type="email" name="email" id="email" value="${param.email}" required><br>
            <button type="submit">Guardar</button>
        </form>
        <button class="cancel" onclick="window.location.href='CtrlClientes'">Cancelar</button>
    </div>
</body>
</html>
