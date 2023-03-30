<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page pageEncoding="UTF-8"%>

<petclinic:layout pageName="adoptionDetails">

    <h2>Información de la Adopción</h2>


    <table class="table table-striped">
        <tr>
            <th><fmt:message key="owner"/></th>
            <td><b><c:out value="${adoption.publishingOwner.firstName} ${adoption.publishingOwner.lastName}"/></b></td>
        </tr>
        <tr>
            <th><fmt:message key="city"/></th>
            <td><c:out value="${adoption.publishingOwner.city}"/></td>
        </tr>
        <tr>
            <th><fmt:message key="pet"/></th>
            <td>
                <dl class="dl-horizontal">
                    <dt><fmt:message key="name"/></dt>
                    <dd><c:out value="${adoption.pet.name}"/></dd>
                    <dt><fmt:message key="birthdate"/></dt>
                    <dd><petclinic:localDate date="${adoption.pet.birthDate}" pattern="yyyy-MM-dd"/></dd>
                    <dt><fmt:message key="type"/></dt>
                    <dd><c:out value="${adoption.pet.type.name}"/></dd>
                </dl>
            </td>
        </tr>
        <tr>
            <th><fmt:message key="description"/></th>
            <td><c:out value="${adoption.description}"/></td>
        </tr>
    </table>
    <h2>Información de los aplicantes</h2>
    <table class="table-condensed">
        <thead>
        <tr>
            <th><fmt:message key="aplicantOwner"/></th>
            <th><fmt:message key="description"/></th>
            <th></th>
        </tr>
        </thead>
        <c:forEach var="application" items="${applications}">
            <tr>
                <td><c:out value="${application.owner.firstName} ${application.owner.lastName}"/></td>
                <td><c:out value="${application.description}"/></td>
                <c:if test="${adoption.publishingOwner == loggedOwner}">
                    <td>
                        <spring:url value="/owners/{ownerId}/pets/{petId}/adoption/{adoptionId}/applications/{newOwnerId}/accept" var="acceptUrl">
                                <spring:param name="adoptionId" value="${adoption.id}"/>
                                <spring:param name="newOwnerId" value="${application.owner.id}"/>
                                <spring:param name="ownerId" value="${adoption.publishingOwner.id}"/>
                                <spring:param name="petId" value="${adoption.pet.id}"/>
                        </spring:url>
                        <a href="${fn:escapeXml(acceptUrl)}">
                                <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                        </a>
                    </td>
                </c:if>
                
            </tr>
        </c:forEach>
        <c:if test="${loggedOwner.id != adoption.publishingOwner.id}">
        <td>
            <spring:url value="/owners/{ownerId}/pets/{petId}/adoption/{adoptionId}/applications/new/{newOwnerId}" var="creationUrl">
                        <spring:param name="ownerId" value="${adoption.publishingOwner.id}"/>
                        <spring:param name="petId" value="${adoption.pet.id}"/>
                        <spring:param name="adoptionId" value="${adoption.id}"/>
                        <spring:param name="newOwnerId" value="${loggedOwner.id}"/>
                </spring:url>
            <a href="${fn:escapeXml(creationUrl)}" class="btn btn-default">Añadir Aplicación</a>
        </td>
        </c:if>
    </table>


</petclinic:layout>