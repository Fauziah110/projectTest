<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home Test</title>
</head>
<body>
    <h1>Welcome to HomeTest</h1>
    <form action="testServlet" method="post">
        <label for="name">Enter your name:</label>
        <input type="text" id="name" name="name" required>
        <br><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
