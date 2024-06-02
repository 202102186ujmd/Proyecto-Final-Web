<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Usuario</title>
    <link rel="stylesheet" href="CSS/EditarUsuario.css" />
    <style>
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #f9f9f9;
        }

        .container h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .container label {
            display: block;
            margin-bottom: 5px;
        }

        .container input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .container button {
            background-color: #4caf50;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
            font-size: 14px;
            transition: background-color 0.3s;
        }

        .container button:hover {
            background-color: #45a049;
        }

        .container .cancel {
            background-color: #f44336;
            margin-top: 10px;
        }

        .container .cancel:hover {
            background-color: #e53935;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Editar Usuario</h1>
        <form action="CtrlUsuario" method="post">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="username" value="${param.username}">
            <label for="username">Username:</label>
            <input type="text" name="username" id="username" value="${param.username}" readonly><br>
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" value="${param.password}" required><br>
            <label for="typeuser">Tipo de Usuario:</label>
            <input type="number" name="typeuser" id="typeuser" value="${param.typeuser}" required><br>
            <button type="submit">Guardar</button>
        </form>
        <button class="cancel" onclick="window.location.href='CtrlUsuario'">Cancelar</button>
    </div>
</body>
</html>
