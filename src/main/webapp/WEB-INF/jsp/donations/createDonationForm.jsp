<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page pageEncoding="UTF-8"%>


<petclinic:layout pageName="newDonation">
        <h2><fmt:message key="newDonation"/></h2>
    
        <form:form modelAttribute="donation" class="form-horizontal">
            <div class="form-group has-feedback">
          
            <petclinic:inputField label="Cantidad" name="budget"/>
            <petclinic:selectField name="owner" label="Propietario" names="${listOwners}" size="1"/>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                <button class="btn btn-default" type="submit"><fmt:message key="doADonation"/></button>
                </div>
            </div>
    </form:form>


</petclinic:layout>
