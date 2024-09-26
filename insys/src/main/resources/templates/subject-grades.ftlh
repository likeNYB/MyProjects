<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>INSYS</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 20px;
            background-color: #f4f4f4; /* Цвет фона */
        }

        h1 {
            color: #333;
        }

        hr {
            margin-top: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
        }

        h4 {
            color: #333;
        }

        form {
            margin-bottom: 20px;
        }

        input[type="text"] {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button,
        input[type="submit"] {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }

        button:hover,
        input[type="submit"]:hover {
            background-color: #006400;
        }

        .grade-item {
            margin-bottom: 10px;
            background-color: #fff; /* Цвет фона ячейки */
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .grades-list {
            display: flex;
            flex-wrap: wrap;
        }

        h3 {
            color: #333;
        }

        /* Стили для кнопок "Назад" и "Список студентов" */
        button, input[type="submit"] {
            margin-right: 10px;
        }

    </style>
</head>
<body>
    <h1>INSYS</h1>
    <hr>
    <#if subject?? && subject.name??>
    <h4>Оценки по предмету ${subject.name}</h4>
        <#if grades??>
            <div class="grades-list">
                <#list grades as grade>
                    <div class="grade-item">
                        <p><b>${grade.value}</b></p>
                        <#if isAdmin || isTeacher>
                        <form action="/subject/${subject.id}/grades/delete/${grade.id}" method="post">
                            <input type="submit" value="Удалить"/>
                        </form>
                        </#if>
                    </div>
                </#list>
            </div>
        <#else>
            <h3>Оценок нет</h3>
        </#if>
    <#else>
        <h3>Предмет не найден</h3>
    </#if>
    <hr>
    <#if isAdmin || isTeacher>
    <h3>Добавить оценку</h3>
    <form action="/subject/${subject.id}/grades/add" method="post">
        <label for="gradeInput">Оценка: </label>
        <input type="text" id="gradeInput" name="value"/>
        <br><br>
        <input type="submit" value="Добавить оценку"/>
    </form>
    </#if>
    <button onclick="goBack()">Назад</button>

    <form action="/students" method="get">
        <input type="submit" value="Список студентов"/>
    </form>

    <script>
        function goBack() {
            window.history.back();
        }
    </script>
</body>
</html>

