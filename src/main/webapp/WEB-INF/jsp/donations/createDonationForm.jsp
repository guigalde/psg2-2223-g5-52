<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page pageEncoding="UTF-8"%>


<petclinic:layout pageName="donations">
    <jsp:body>
        <h2><fmt:message key="newDonation"/></h2>
        <form:form modelAttribute="owner" class="form-horizontal" id="add-owner-form">
        <div class="form-group has-feedback">
            <petclinic:inputField label="Fecha de Donacion" name="dateOfDonation" readonly="true" value="${dateOfDonation}"/>
            <petclinic:inputField label="Cantidad" name="budget"/>
            <petclinic:inputField label="Dirección" name="address"/>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button class="btn btn-default" type="submit"><fmt:message key="doADonation"/></button>
            </div>
        </div>
    </form:form>

    </jsp:body>

</petclinic:layout>
