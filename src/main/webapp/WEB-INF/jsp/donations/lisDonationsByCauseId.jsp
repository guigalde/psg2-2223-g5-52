<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@page pageEncoding="UTF-8"%>

<petclinic:layout pageName="listDonationsByCauseId">
    <h2><fmt:message key="donations"/></h2>

    <table id="donationsTable" class="table table-striped" >
        <thead>
        <tr>
            <th><fmt:message key="cause"/></th>
            <th><fmt:message key="date"/></th>
            <th><fmt:message key="budget"/></th>
            <th><fmt:message key="owner"/></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${donationsCauseId}" var="donation">
            <tr>
                <td>
                  <c:out value= "${donation.cause.name}"/>
                </td>
                <td>
                    <c:out value="${donation.dateOfDonation}"/>
                </td>
                <td>
                    <c:out value="${donation.budget}"/>
                </td>   
                <td>
                    <c:out value="${donation.owner.name}"/>
                </td>     
            </tr>
        </c:forEach>
        </tbody>
    </table>
</petclinic:layout>
