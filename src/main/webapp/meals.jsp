<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="meals" scope="request" type="java.util.List<ru.javawebinar.topjava.model.MealTo>"/>
<jsp:useBean id="formatter" scope="request" type="java.time.format.DateTimeFormatter"/>

<html lang="ru">
<head>
    <title>Meals</title>
    <style type="text/css">
        table {
            border-collapse: collapse;
        }

        td, th {
            padding: 4px;
            border: 1px solid black;
        }
    </style>
</head>
<body>
<h3><a href="index.html">Home</a></h3>
<hr>
<h2>Meals</h2>
<table>
    <tbody>
    <tr>
        <th>Date</th>
        <th>Description</th>
        <th>Calories</th>
    </tr>

    <c:forEach var="meal" items="${meals}">
        <tr style="color: ${meal.excess ? "red" : "green"}">
            <td><c:out value="${meal.dateTime.format(formatter)}"/></td>
            <td><c:out value="${meal.description}"/></td>
            <td><c:out value="${meal.calories}"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>