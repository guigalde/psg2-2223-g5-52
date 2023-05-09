<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" crossorigin="anonymous">
</head>
<petclinic:layout pageName="plan">
    <h1>Cambiar plan</h1>
    <form:form modelAttribute="user" class="form-horizontal" id="update-plan-form">
        <div class="form-group has-feedback">
            
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th><b>Planes disponibles</b></th>
                        <th>
                            <b><br>Básico</br></b>
                            <small style="font-size: 12px; font-weight: 400;">Plan gratuito</small>
                        </th>
                        <th>
                            <b><br>Avanzado</br></b>
                            <small style="font-size: 12px; font-weight: 400;">Prestaciones extendidas</small>
                        </th>
                        <th>
                            <b><br>Pro</br></b>
                            <small style="font-size: 12px; font-weight: 400;">El mejor servicio disponible</small>
                        </th>
                    </tr>
                </thead>
                <tr>
                    <td>Precios</td>
                    <td>
                        <br>Gratis</br>
                    </td>
                    <td>
                        <br>30.00 €/ año</br>
                    </td>
                    <td>
                        <br>90.00 €/ año</br>
                    </td>
                </tr>
                <tr>
                    <td>Acuerdo a nivel de servicio</td>
                    <td><i class="fas fa-times"></i></td>
                    <td><i class="fas fa-check"></i></td>
                    <td><i class="fas fa-check"></i></td>
                </tr>
                <tr>
                    <td>
                        <br>Manejo de múltiples clínicas</br>
                        <small style="font-size: 12px; font-weight: 400;">Disponible solo para dueños de clínicas</small>
                    </td>
                    <td><br><i class="fas fa-times"></i></br></td>
                    <td><br><i class="fas fa-check"></i></br></td>
                    <td><br><i class="fas fa-check"></i></br></td>
                </tr>
                <tr>
                    <td>Límite de mascotas</td>
                    <td>3</td>
                    <td>6</td>
                    <td>Sin límite</td>
                </tr>
                <tr>
                    <td>Límite de consultas mensuales</td>
                    <td>1</td>
                    <td>2</td>
                    <td>4</td>
                </tr>
                <tr>
                    <td>
                        <br>Número máximo de veterinarios</br>
                        <small style="font-size: 12px; font-weight: 400;">Disponible solo para dueños de clínicas</small>
                    </td>
                    <td><br>2</br></td>
                    <td><br>4</br></td>
                    <td><br>Sin límite</br></td>
                </tr>
                <tr>
                    <td>Tipos de mascotas disponibles</td>
                    <td>Perros y gatos</td>
                    <td>Perros, gatos, pájaros y hamsters</td>
                    <td>Todos los tipos</td>
                </tr>
                <tr>
                    <td>Soporte a peticiones de usuario</td>
                    <td><i class="fas fa-times"></i></td>
                    <td><i class="fas fa-times"></i></td>
                    <td><i class="fas fa-check"></i></td>
                </tr>
                <tr>
                    <td>Admision de solicitudes de cambio</td>
                    <td><i class="fas fa-times"></i></td>
                    <td><i class="fas fa-times"></i></td>
                    <td><i class="fas fa-check"></i></td>
                </tr>
                <tr>
                    <td>Disponibilidad del soporte</td>
                    <td><i class="fas fa-times"></i></td>
                    <td><i class="fas fa-times"></i></td>
                    <td> 9:00 a 21:00 de lunes a viernes</td>
                </tr>
                <tr>
                    <td>Disponibilidad del servicio</td>
                    <td>90%</td>
                    <td>95%</td>
                    <td>99%</td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="radio" id="basic" name="plan" value="<c:out value='${plans.get(0)}'/>"/></td>
                    <td><input type="radio" id="basic" name="plan" value="<c:out value='${plans.get(1)}'/>"/></td>
                    <td><input type="radio" id="basic" name="plan" value="<c:out value='${plans.get(2)}'/>"/></td>
                </tr>
            </table>
        </div>
        <div class="form-group">
            <div>
                <button class="btn btn-default" type="submit">Cambiar plan</button>
            </div>
        </div>
    </form:form>
</petclinic:layout>
