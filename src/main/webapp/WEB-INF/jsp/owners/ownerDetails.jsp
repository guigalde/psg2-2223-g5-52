<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page pageEncoding="UTF-8"%>

<petclinic:layout pageName="owners">

    <h2>Información del propietario</h2>


    <table class="table table-striped">
        <tr>
            <th><fmt:message key="name"/></th>
            <td><b><c:out value="${owner.firstName} ${owner.lastName}"/></b></td>
        </tr>
        <tr>
            <th><fmt:message key="address"/></th>
            <td><c:out value="${owner.address}"/></td>
        </tr>
        <tr>
            <th><fmt:message key="city"/></th>
            <td><c:out value="${owner.city}"/></td>
        </tr>
        <tr>
            <th><fmt:message key="telephone"/></th>
            <td><c:out value="${owner.telephone}"/></td>
        </tr>
    </table>

    <spring:url value="{ownerId}/edit" var="editUrl">
        <spring:param name="ownerId" value="${owner.id}"/>
    </spring:url>
    <a href="${fn:escapeXml(editUrl)}" class="btn btn-default"><fmt:message key="editOwner"/></a>

    <spring:url value="{ownerId}/pets/new" var="addUrl">
        <spring:param name="ownerId" value="${owner.id}"/>
    </spring:url>
    <a href="${fn:escapeXml(addUrl)}" class="btn btn-default"><fmt:message key="addNewPet"/></a>
    <spring:url value="{ownerId}/delete" var="deleteUrl">
        <spring:param name="ownerId" value="${owner.id}"/>
    </spring:url>
    <a href="${fn:escapeXml(deleteUrl)}" class="btn btn-default"><fmt:message key="deleteOwner"/></a>

    <br/>
    <br/>
    <br/>
    <h2>Mascotas y visitas</h2>

    <table class="table table-striped">
        <c:forEach var="pet" items="${owner.pets}">

            <tr>
                <td valign="top">
                    <dl class="dl-horizontal">
                        <dt><fmt:message key="name"/></dt>
                        <dd><c:out value="${pet.name}"/></dd>
                        <dt><fmt:message key="birthdate"/></dt>
                        <dd><petclinic:localDate date="${pet.birthDate}" pattern="yyyy-MM-dd"/></dd>
                        <dt><fmt:message key="type"/></dt>
                        <dd><c:out value="${pet.type.name}"/></dd>
                    </dl>
                </td>
                <td valign="top">
                    <table class="table-condensed">
                        <thead>
                        <tr>
                            <th><fmt:message key="visitDate"/></th>
                            <th><fmt:message key="description"/></th>
                            <th><fmt:message key="delete"/></th>
                        </tr>
                        </thead>
                        <c:forEach var="visit" items="${pet.visits}">
                            <tr>
                                <td><petclinic:localDate date="${visit.date}" pattern="yyyy-MM-dd"/></td>
                                <td><c:out value="${visit.description}"/></td>
                                <td>
                                <a href="/owners/${owner.id}/pets/${pet.id}/visits/${visit.id}/delete">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                </a>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td>
                                <spring:url value="/owners/{ownerId}/pets/{petId}/edit" var="petUrl">
                                    <spring:param name="ownerId" value="${owner.id}"/>
                                    <spring:param name="petId" value="${pet.id}"/>
                                </spring:url>
                                <a href="${fn:escapeXml(petUrl)}"><fmt:message key="editPet"/></a>
                            </td>
                            <td>
                                <spring:url value="/owners/{ownerId}/pets/{petId}/visits/new" var="visitUrl">
                                    <spring:param name="ownerId" value="${owner.id}"/>
                                    <spring:param name="petId" value="${pet.id}"/>
                                </spring:url>
                                <a href="${fn:escapeXml(visitUrl)}"><fmt:message key="addVisit"/></a>
                            </td>
                            <td valign="top">
                                <td>
                                    <spring:url value="/owners/{ownerId}/pets/{petId}/booking/new" var="visitUrl">
                                        <spring:param name="ownerId" value="${owner.id}"/>
                                        <spring:param name="petId" value="${pet.id}"/>
                                    </spring:url>
                                    <a class="btn btn-default" href="${fn:escapeXml(visitUrl)}"><fmt:message key="addBooking"/></a> 
                                </td>
                                <c:if test="${loggedOwner.id == owner.id}">
                                <td>
                                    <spring:url value="/owners/{ownerId}/pets/{petId}/adoption/new" var="adoptionUrl">
                                        <spring:param name="ownerId" value="${owner.id}"/>
                                        <spring:param name="petId" value="${pet.id}"/>
                                    </spring:url>
                                    <a class="btn btn-default" href="${fn:escapeXml(adoptionUrl)}"><fmt:message key="addAdoption"/></a> 
                                </td>
                                </c:if>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

        </c:forEach>
    </table>

    <h2><fmt:message key="bookings"/></h2>

    <table class="table table-striped">
        <c:forEach var="booking" items="${owner.bookings}">

            <tr>
                <td valign="top">
                    <dl class="dl-horizontal">
                        <dt><fmt:message key="petName"/></dt>
                        <dd><c:out value="${booking.pet.name}"/></dd>
                        <dt><fmt:message key="startDate"/></dt>
                        <dd><petclinic:localDate date="${booking.startDate}" pattern="yyyy-MM-dd"/></dd>
                        <dt><fmt:message key="finishDate"/></dt>
                        <dd><petclinic:localDate date="${booking.finishDate}" pattern="yyyy-MM-dd"/></dd>
                        <dd><a href="/owners/${owner.id}/pets/${booking.pet.id}/booking/${booking.id}/delete">
                            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                        </a></dd>
                    </dl>
                </td>
                
            </tr>

        </c:forEach>
    </table>

</petclinic:layout>
