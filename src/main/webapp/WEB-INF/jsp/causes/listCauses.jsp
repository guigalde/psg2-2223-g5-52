<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@page pageEncoding="UTF-8"%>

<petclinic:layout pageName="listCauses">
    <h2><fmt:message key="causes"/></h2>

    <table id="causesTable" class="table table-striped" >
        <thead>
        <tr>
            <th><fmt:message key="cause"/></th>
            <th><fmt:message key="totalBudget"/></th>
            <th><fmt:message key="targetBudget"/></th>
            <th><fmt:message key="causeDetails"/></th>
            <th><fmt:message key="doADonation"/></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${budgetPerCause}" var="causeMap">
            <tr>
                <td>
                  <c:out value= "${causeMap.key.name}"/>
                </td>
                <td>
                    <c:out value="${causeMap.value}"/>
                </td>
                <td>
                    <c:out value="${causeMap.key.budgetTarget}"/>
                </td>
                <td>
                    <a href="/cause/${causeMap.key.id}/details"><fmt:message key="causeDetails"/></a> 
                </td>
                <td>
                    <c:choose>
                    <c:when test="${causeMap.value-causeMap.key.budgetTarget>=0}">
                        <fmt:message key="closed"/>
                    </c:when>
                    <c:otherwise>
                    <a href="/cause/${causeMap.key.id}/donation/new"><fmt:message key="doADonation"/></a>
                    </c:otherwise>
                    </c:choose>
                </td>
                       
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a class="btn btn-default" href="/cause/new"><fmt:message key="newCause"/></a> 


</petclinic:layout>
