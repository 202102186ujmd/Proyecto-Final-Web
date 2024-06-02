<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Nuevo Cliente</title>
    <link rel="stylesheet" href="CSS/NuevoCliente.css" />
</head>
<body>
    <div class="container">
        <h1>Nuevo Cliente</h1>
        <form action="CtrlClientes" method="post">
            <input type="hidden" name="action" value="add">
            <label for="nombre">Nombre:</label>
            <input type="text" name="nombre" id="nombre" required><br>
            <label for="apellido">Apellido:</label>
            <input type="text" name="apellido" id="apellido" required><br>
            <label for="email">Email:</label>
            <input type="email" name="email" id="email" required><br>
            <button type="submit">Guardar</button>
        </form>
        <button class="cancel" onclick="window.location.href='CtrlClientes'">Cancelar</button>
    </div>
</body>
</html>
