<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page pageEncoding="UTF-8"%>


<petclinic:layout pageName="adoptions">
    <jsp:body>
        <h2><fmt:message key="newAdoption"/> <c:out value="${adoption.pet}"></c:out></h2>
        <form:form modelAttribute="adoption" class="form-horizontal">
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="hidden" name="pet" value="${adoption.pet.id}"/>
                    <input type="hidden" name="publishingOwner" value="${adoption.publishingOwner.id}"/>
                    <input type="hidden" name="accepted" value="${adoption.accepted}"/>
                    <petclinic:inputField name="description" label="Descripción"/>
                    <button class="btn btn-default" type="submit"><fmt:message key="addAdoption"/></button>
                </div>
            </div>
        </form:form>

    </jsp:body>

</petclinic:layout>