<!DOCTYPE html>
<html>
<head>
    <title>INSYS</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }

        h1 {
            color: #333;
            margin-bottom: 5px;
            margin-top: 0;
            text-align: left;
        }

        h4 {
            color: #333;
            font-size: 1.5em;
            margin-top: 10px;
            text-align: left;
        }

        hr {
            margin-top: 15px;
            width: 100%;
            border: 1px solid #000;
        }

        form {
            margin-bottom: 15px;
        }

        input[type="text"] {
            padding: 5px;
        }

        input[type="submit"], button {
            padding: 8px 15px;
            background-color: #008000;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover, button:hover {
            background-color: #006400;
        }

        a {
            color: #1e90ff;
            text-decoration: none;
            transition: color 0.3s;
        }

        a:hover {
            color: #0056b3;
            text-decoration: underline;
        }

        .student-info {
            margin-bottom: 20px;
        }

        .student-info p {
            margin: 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
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

        .add-student-form {
            border: 2px solid #000;
            border-radius: 8px;
            padding: 15px;
            width: 50%;
            margin-top: 20px;
        }

        .add-student-form input[type="submit"] {
            background-color: #008000;
            color: #fff; /* White text color */
            margin-top: 10px; /* Adjust margin */
        }

        .admin-buttons {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .admin-buttons input[type="submit"] {
            margin: 0 10px;
        }

        .logout-btn {
            background-color: #dc3545;
        }
    </style>
</head>
<body>
    <h1>INSYS</h1>
    <hr>
    <form action="/students" method="get">
        <input type="text" name="name" placeholder="Введите имя студента">
        <input type="submit" value="Поиск">
    </form>

    <h4>Студенты</h4>
    <table>
        <tr>
            <th>№</th>
            <th>ФИО</th>
            <th>Информация</th>
        </tr>
        <#if students??>
            <#list students as student>
                <tr class="student-info">
                    <td>${student_index + 1}</td>
                    <td>${student.name}</td>
                    <td><a href="/student/${student.id}">Подробнее...</a></td>
                </tr>
            </#list>
        <#else>
            <tr>
                <td colspan="3"><h3>Студентов нет</h3></td>
            </tr>
        </#if>
    </table>

    <#if isAdmin>
        <div class="add-student-form">
            <h3>Добавить студента</h3>
            <form action="/student/create" method="post">
                Имя студента: <input type="text" name="name"><br>
                Группа: <input type="text" name="studentGroup" style="margin-top: 5px;"><br>
                <input type="submit" value="Добавить студента">
            </form>
        </div>

        <div class="admin-buttons">
            <form action="/admin" method="get">
                <input type="submit" value="Пользователи">
            </form>
        </div>
    </#if>
    <form action="/students" method="get">
        <button type="submit">Список студентов</button>
    </form>
    <form action="/logout" method="get">
        <input type="submit" value="Выход">
    </form>
</body>
</html>
