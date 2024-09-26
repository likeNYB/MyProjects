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
        }

        form {
            margin-bottom: 15px;
        }

        input[type="text"] {
            padding: 5px;
        }

        input[type="submit"],
        button {
            padding: 8px 15px;
            background-color: #388e3c;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover,
        button:hover {
            background-color: #2e7d32;
        }

        a {
            color: #1e90ff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .subject-info {
            margin-bottom: 20px;
        }

        .subject-info p {
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


        .student-info {
            margin-bottom: 20px;
        }

        .student-info b {
            margin-bottom: 10px;
            display: block;
        }
    </style>
</head>
<body>
    <h1>INSYS</h1>
    <hr>

    <h4>Подробная информация о студенте</h4>
<#if student??>
    <div class="student-info">
                <b>Имя студента: </b>${student.name?if_exists}<br>
                <b>Группа: </b>${student.studentGroup?if_exists}<br>
                <#if isAdmin>
                    <button type="submit">Удалить студента</button>
                </#if>
            </div>
    <hr>
    <table>
        <tr>
            <th>№</th>
            <th>Предмет</th>
            <th>Оценки</th>
            <#if isAdmin || isTeacher>
            <th>Удаление</th>
            </#if>
        </tr>
        <#if subjects??>
            <#list subjects as subject>
                <tr class="subject-info">
                    <td>${subject_index + 1}</td>
                    <td><b>${subject.name}</b></td>
                    <td><a href="/subject/${subject.id}/grades">Оценки...</a></td>
                    <#if isAdmin || isTeacher>
                    <td>
                        <form action="/student/${student.id}/subjects/delete/${subject.id}" method="post">
                            <button type="submit">Удалить предмет</button>
                        </form>
                    </td>
                    </#if>
                </tr>
            </#list>
        <#else>
            <tr>
                <td colspan="4"><h3>Нет предметов</h3></td>
            </tr>
        </#if>
    </table>
<#else>
    <h3>Студент не найден</h3>
</#if>
<hr>
<#if isAdmin || isTeacher>
    <h3>Добавить предмет</h3>
    <form action="/student/${student.id}/subjects/add" method="post">
        Название предмета: <input type="text" name="name"><br><br>
        <button type="submit">Добавить предмет</button>
    </form>
</#if>
<#if isAdmin>
    <form action="/student/delete/${student.id}" method="post">
        <button type="submit">Удалить студента</button>
    </form>
</#if>
<form action="/students" method="get">
    <button type="submit">Список студентов</button>
</form>
</body>
</html>

