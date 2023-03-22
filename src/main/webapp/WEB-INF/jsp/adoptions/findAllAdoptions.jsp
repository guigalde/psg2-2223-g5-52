<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@page pageEncoding="UTF-8"%>
<style>
    th {text-align: center;}
</style>
<petclinic:layout pageName="adoptions">
    <h2><fmt:message key="adoptions"/></h2>
    <table id="adoptionTable" class="table table-striped">
        <thead>
            <th><fmt:message key="ownerName"/></th>
            <th><fmt:message key="ownerCity"/></th>
            <th><fmt:message key="pet"/></th>
            <th><fmt:message key="description"/></th>
        <tbody>
        <c:forEach items="${adoptions}" var="adoption">
            <tr>
                <td>
                    <c:out value="${adoption.publishingOwner.firstName} ${adoption.publishingOwner.lastName}"/>
                </td>
                <td>
                    <c:out value="${adoption.publishingOwner.city} ${adoption.publishingOwner.city}"/>
                </td>
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
                <td> 
                    <c:out value="${adoption.description}"/>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</petclinic:layout>