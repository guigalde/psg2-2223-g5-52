<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="vets">
    <jsp:body>
        <form:form modelAttribute="vet"
                   class="form-horizontal">
            <div class="form-group has-feedback">
                <petclinic:inputField label="First Name" name="firstName"/>
                <petclinic:inputField label="Last Name" name="lastName"/>
                <div class="form-group">
                    <span>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;</span>
                    <label for="specialties">Specialties</label>
                    <span>&emsp;&emsp;</span>
                    <form:checkboxes items="${specialties}" path="specialties" itemValue="name" delimiter="&emsp;&emsp;"/>
                </div>
            </div>
            <button type="submit">Submit</button>
        </form:form>
    </jsp:body>
</petclinic:layout>