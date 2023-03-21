<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page pageEncoding="UTF-8"%>

<petclinic:layout pageName="causeDetails">

<h2><fmt:message key="detailsof"/><c:out value="${cause.name}"/></h2>

      
        <h4><c:out value="${cause.description}"/></h4>
        <br>


        <h3><fmt:message key="org"/></h2>
       
        <h4><c:out value="${cause.organizationInCharge}"/></h4>
        <br>

<h3><fmt:message key="listOfDonations"/></h3>
<br>
<table id="donationsTable" class="table table-striped" >
    <thead>
    <tr>
        <th><fmt:message key="dayOfDonation"/></th>
        <th><fmt:message key="amount"/></th>
        <th><fmt:message key="donor"/></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${donoList}" var="dono">
        <tr>
            <td>
              <c:out value= "${dono.dateOfDonation}"/>
            </td>
            <td>
                <c:out value="${dono.budget}"/>
            </td>
            <td>
                <c:out value="${dono.owner}"/>
            </td>                  
        </tr>
    </c:forEach>
    </tbody>
</table>


<a class="btn btn-default" href="/cause"><fmt:message key="return"/></a> 
<td>
    <a class="btn btn-default" href="/cause/${causeMap.key.id}/donation/new"><fmt:message key="doADonation"/></a> 
</td>

</petclinic:layout>
