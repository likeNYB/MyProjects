<!DOCTYPE html>
<html>
<head>
    <title>INSYS</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h1 {
            color: #333;
        }

        hr {
            margin-top: 15px;
        }

        h4 {
            color: #333;
            text-align: center;
            font-size: 24px;
        }

        form {
            margin-bottom: 15px;
        }

        input[type="text"],
        input[type="password"] {
            padding: 5px;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            padding: 8px 15px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            cursor: pointer;
            margin-top: 5px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        a {
            color: #1e90ff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .user-info {
            margin-bottom: 20px;
        }

        .user-info p {
            margin: 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #000;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #000;
            color: #fff;
        }
    </style>
</head>
<body>
    <h1>INSYS</h1>
    <hr>
    <h4>Пользователи</h4>
    <table>
        <tr>
            <th>№</th>
            <th>Логин</th>
            <th>Пароль</th>
            <th>Роль</th>
            <th>Удаление</th>
        </tr>
        <#if users??>
            <#list users as user>
                <tr class="user-info">
                    <td>${user_index + 1}</td>
                    <td><b>${user.username?if_exists}</b></td>
                    <td>${user.password?if_exists}</td>
                    <td>${user.role?if_exists}</td>
                    <td>
                        <form action="/user/delete/${user.id}" method="post">
                            <button type="submit">Удалить пользователя</button>
                        </form>
                    </td>
                </tr>
            </#list>
        <#else>
            <tr>
                <td colspan="5"><h3>Пользователей нет</h3></td>
            </tr>
        </#if>
    </table>
    <hr>
    <h3>Добавить пользователя</h3>
    <form action="/user/create" method="post">
        Имя пользователя: <input type="text" name="username"><br>
        Пароль: <input type="password" name="password"><br>
        Роль: <input type="text" name="role"><br>
        <input type="submit" value="Добавить пользователя">
    </form>
    <form action="/students" method="get">
        <button type="submit">Список студентов</button>
    </form>
</body>
</html>
