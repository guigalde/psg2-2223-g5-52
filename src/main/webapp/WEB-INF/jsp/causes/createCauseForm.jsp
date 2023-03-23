<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page pageEncoding="UTF-8"%>


<petclinic:layout pageName="newCause">
        <h2><fmt:message key="newCause"/></h2>
    
        <form:form modelAttribute="cause" class="form-horizontal">
            <div class="form-group has-feedback">
          
            <petclinic:inputField label="Nombre de la Causa" name="name"/>
            <petclinic:inputField label="Descripcion" name="description"/>
            <petclinic:inputField label="Organización al cargo" name="organizationInCharge"/>
            <petclinic:inputField label="Cantidad objetivo" name="budgetTarget"/>

            </div>
            
            <br>
       
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                <button class="btn btn-default" type="submit"><fmt:message key="createCause"/></button>
                </div>
            </div>
    </form:form>


</petclinic:layout>
