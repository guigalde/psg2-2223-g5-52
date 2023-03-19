<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page pageEncoding="UTF-8"%>

<petclinic:layout pageName="applications">
    <jsp:body>
        <h2><fmt:message key="newApplication"/></h2>
        <form:form modelAttribute="application" class="form-horizontal" >
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="hidden" name="owner" value="${application.owner.id}"/>
                    <input type="hidden" name="adoption" value="${application.adoption.id}"/>
                    <petclinic:inputField name="description" label="Descripción"/>
                    <button class="btn btn-default" type="submit"><fmt:message key="addApplication"/></button>
                </div>
            </div>
        </form:form>

    </jsp:body>

</petclinic:layout>