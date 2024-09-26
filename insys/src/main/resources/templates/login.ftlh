<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background-color: #f2f2f2;
        }

        form {
            text-align: center;
            border: 2px solid #d3d3d3;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
        }

        h1 {
            color: #333;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
            border: 1px solid #d3d3d3;
            border-radius: 4px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            background-color: #007bff;
            color: #fff; /* White text color */
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form action="/" method="post">
        <h1>Login</h1>
        <label for="username">Логин:</label>
        <input type="text" id="username" name="username" required>
        <br>
        <label for="password">Пароль:</label>
        <input type="password" id="password" name="password" required>
        <br>
        <input type="submit" value="Вход">
    </form>
</body>
</html>

