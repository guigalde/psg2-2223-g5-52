<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page pageEncoding="UTF-8"%>


<petclinic:layout pageName="donations">
    <jsp:body>
        <h2><fmt:message key="newBooking"/></h2>
        <table class="table table-striped">
            <thead>
            <tr>
                <th><fmt:message key="name"/></th>
                <th><fmt:message key="birthdate"/></th>
                <th><fmt:message key="type"/></th>
                <th><fmt:message key="owner"/></th>
            </tr>
            </thead>
            <tr>
                <td><c:out value="${booking.pet.name}"/></td>
                <td><petclinic:localDate date="${booking.pet.birthDate}" pattern="yyyy/MM/dd"/></td>
                <td><c:out value="${booking.pet.type.name}"/></td>
                <td><c:out value="${booking.owner.firstName} ${booking.owner.lastName}"/></td>
            </tr>
        </table>

        <form:form modelAttribute="booking" class="form-horizontal">
            <div class="form-group has-feedback">
                <petclinic:inputField label="Fecha de inicio" name="startDate"/>
                <petclinic:inputField label="Fecha de fin" name="finishDate"/>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="hidden" name="pet_Id" value="${booking.pet.id}"/>
                    <input type="hidden" name="owner_Id" value="${booking.owner.id}"/>
                    <button class="btn btn-default" type="submit"><fmt:message key="addBooking"/></button>
                </div>
            </div>
        </form:form>

    </jsp:body>

</petclinic:layout>
