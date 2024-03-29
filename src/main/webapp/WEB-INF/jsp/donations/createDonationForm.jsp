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
          
            <label for="target" class="col-sm-2 control-label"><fmt:message key="budgetTarget"/></label>
            <input type="number" min="1" name="budget" step="0.01" id="target" required/> €
    
            </div>
            <div class="col-sm-10">
            <label for="owner" class="col-sm-2 control-label"><fmt:message key="owner"/></label>
            <select name="owner">
                <c:forEach items="${listOwners}" var="owner" varStatus="loop">
                    <option value="${loop.index+1}">
                        <c:out value="${owner.firstName} "/> <c:out value="${owner.lastName}"/>
                    </option>
                </c:forEach>
            </select>
            </div>
            <br>
            <br>
            <br>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                <button class="btn btn-default" type="submit"><fmt:message key="doADonation"/></button>
                </div>
            </div>
    </form:form>


</petclinic:layout>
