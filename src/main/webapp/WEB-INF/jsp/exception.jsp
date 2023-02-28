<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="error">

    <spring:url value="/resources/images/pc_crash.png" var="petsImage"/>
    <img src="${petsImage}"/>

    <h2>Ha ocurrido un error</h2>

    <p>${exception.message}</p>

</petclinic:layout>
