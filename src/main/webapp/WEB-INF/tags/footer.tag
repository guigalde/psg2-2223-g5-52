<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="col-md-12" style="display: flex; flex-direction: column; align-items: end;">
    <a href="<spring:url value="/support" htmlEscape="true" />" >
        <img  src="<spring:url value="/resources/images/support.png" />" style="width: 80px; height: 80px;" />
        <h2>Soporte</h2>
    </a>

</div>
<%-- Placed at the end of the document so the pages load faster --%>
<spring:url value="/webjars/jquery/2.2.4/jquery.min.js" var="jQuery"/>
<script src="${jQuery}"></script>

<%-- jquery-ui.js file is really big so we only load what we need instead of loading everything --%>
<spring:url value="/webjars/jquery-ui/1.11.4/jquery-ui.min.js" var="jQueryUiCore"/>
<script src="${jQueryUiCore}"></script>

<%-- Bootstrap --%>
<spring:url value="/webjars/bootstrap/3.3.6/js/bootstrap.min.js" var="bootstrapJs"/>
<script src="${bootstrapJs}"></script>



