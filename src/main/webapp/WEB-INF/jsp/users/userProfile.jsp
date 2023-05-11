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
<petclinic:layout pageName="profile">

    <h2>Información de Perfil</h2>


    <table class="table table-striped">
        <tr>
            <th><fmt:message key="name"/></th>
            <td><c:out value="${loggedOwner.firstName} ${loggedOwner.lastName}"/></b></td>
        </tr>
        <tr>
            <th><fmt:message key="address"/></th>
            <td><c:out value="${loggedOwner.address}"/></td>
        </tr>
        <tr>
            <th><fmt:message key="city"/></th>
            <td><c:out value="${loggedOwner.city}"/></td>
        </tr>
        <tr>
            <th><fmt:message key="telephone"/></th>
            <td><c:out value="${loggedOwner.telephone}"/></td>
        </tr>
      
    </table>
    
    <table class="table table-striped">
                             
                <c:if test="${currentUserPlan.name eq 'BASIC'}"><h2>Usted tiene el Plan Basic</h2>
              
                <thead><b><th>Beneficios:      </th></b></thead> 
            
                <tr>
                    <td>Acuerdo a nivel de servicio</td>
                    <td><i class="fas fa-times"></i></td>
                  
                </tr>
               
                    <tr>
                        <td>
                            <br>Manejo de múltiples clínicas</br>
                            <small style="font-size: 12px; font-weight: 400;">Disponible solo para dueños de clínicas</small>
                        </td>
                        <td><br><i class="fas fa-times"></i></br></td>
                        
                    </tr>
                    <tr>
                        <td>
                            <br>Manejo de múltiples clínicas</br>
                            <small style="font-size: 12px; font-weight: 400;">Disponible solo para dueños de clínicas</small>
                        </td>
                        <td><br><i class="fas fa-times"></i></br></td>
                       
                    </tr>
                    <tr>
                        <td>Límite de mascotas</td>
                        <td>3</td>
                  
                    </tr>
                    <tr>
                        <td>Límite de consultas mensuales</td>
                        <td>1</td>
                      
                    </tr>
                    <tr>
                        <td>
                            <br>Número máximo de veterinarios</br>
                            <small style="font-size: 12px; font-weight: 400;">Disponible solo para dueños de clínicas</small>
                        </td>
                        <td><br>2</br></td>
                    
                    </tr>
                    <tr>
                        <td>Tipos de mascotas disponibles</td>
                        <td>Perros y gatos</td>
                      
                    </tr>
                    <tr>
                        <td>Soporte a peticiones de usuario</td>
                        <td><i class="fas fa-times"></i></td>
                       
                    </tr>
                    <tr>
                        <td>Admision de solicitudes de cambio</td>
                        <td><i class="fas fa-times"></i></td>
                       
                    </tr>
                    <tr>
                        <td>Disponibilidad del soporte</td>
                        <td><i class="fas fa-times"></i></td>
                       
                    </tr>
                    <tr>
                        <td>Disponibilidad del servicio</td>
                        <td>90%</td>
                    </tr>
                    <tr>
                        <td>Precios</td>
                        <td>
                            <br>Gratis</br>
                        </td>
                    </tr>
            
            </c:if>
                <c:if test="${currentUserPlan.name eq 'ADVANCED'}">
                <h2>Usted tiene el Plan Advanced</h2>
                <thead><b><th>Beneficios:</th></b></thead> 
              
                <tr>
                    <td>Acuerdo a nivel de servicio</td>
                    
                    <td><i class="fas fa-check"></i></td>
                    
                </tr>
               
                    <tr>
                        <td>
                            <br>Manejo de múltiples clínicas</br>
                            <small style="font-size: 12px; font-weight: 400;">Disponible solo para dueños de clínicas</small>
                        </td>
                       
                        <td><br><i class="fas fa-check"></i></br></td>
                        
                    </tr>
                    <tr>
                        <td>
                            <br>Manejo de múltiples clínicas</br>
                            <small style="font-size: 12px; font-weight: 400;">Disponible solo para dueños de clínicas</small>
                        </td>
                        
                        <td><br><i class="fas fa-check"></i></br></td>
                        
                    </tr>
                    <tr>
                        <td>Límite de mascotas</td>
                    
                        <td>6</td>
                       
                    </tr>
                    <tr>
                        <td>Límite de consultas mensuales</td>
                     
                        <td>2</td>
                       
                    </tr>
                    <tr>
                        <td>
                            <br>Número máximo de veterinarios</br>
                            <small style="font-size: 12px; font-weight: 400;">Disponible solo para dueños de clínicas</small>
                        </td>
                       
                        <td><br>4</br></td>
                        
                    </tr>
                    <tr>
                        <td>Tipos de mascotas disponibles</td>
                   
                        <td>Perros, gatos, pájaros y hamsters</td>
                        
                    </tr>
                    <tr>
                        <td>Soporte a peticiones de usuario</td>
                        
                        <td><i class="fas fa-times"></i></td>
                        
                    </tr>
                    <tr>
                        <td>Admision de solicitudes de cambio</td>
                    
                        <td><i class="fas fa-times"></i></td>
                        
                    </tr>
                    <tr>
                        <td>Disponibilidad del soporte</td>
                      
                        <td><i class="fas fa-times"></i></td>
                    
                    </tr>
                    <tr>
                        <td>Disponibilidad del servicio</td>
                       
                        <td>95%</td>
                        
                    </tr>
                    <tr>
                        <td>Precios</td>
                        
                        <td>
                            <br>30.00 €/ año</br>
                        </td>
                        
                    </tr></c:if>
                <c:if test="${currentUserPlan.name eq 'PRO'}"><h2>Usted tiene el Plan Pro</h2>
                <thead><b><th>Beneficios:      </th></b></thead> 
                <tr>
                    <td>Acuerdo a nivel de servicio</td>
                    
                    <td><i class="fas fa-check"></i></td>
                </tr>
               
                    <tr>
                        <td>
                            <br>Manejo de múltiples clínicas</br>
                            <small style="font-size: 12px; font-weight: 400;">Disponible solo para dueños de clínicas</small>
                        </td>
                        
                        <td><br><i class="fas fa-check"></i></br></td>
                    </tr>
                    <tr>
                        <td>
                            <br>Manejo de múltiples clínicas</br>
                            <small style="font-size: 12px; font-weight: 400;">Disponible solo para dueños de clínicas</small>
                        </td>
                        
                        <td><br><i class="fas fa-check"></i></br></td>
                    </tr>
                    <tr>
                        <td>Límite de mascotas</td>
                        
                        <td>Sin límite</td>
                    </tr>
                    <tr>
                        <td>Límite de consultas mensuales</td>
                        
                        <td>4</td>
                    </tr>
                    <tr>
                        <td>
                            <br>Número máximo de veterinarios</br>
                            <small style="font-size: 12px; font-weight: 400;">Disponible solo para dueños de clínicas</small>
                        </td>
                     
                        <td><br>Sin límite</br></td>
                    </tr>
                    <tr>
                        <td>Tipos de mascotas disponibles</td>
                      
                        <td>Todos los tipos</td>
                    </tr>
                    <tr>
                        <td>Soporte a peticiones de usuario</td>
                        
                        <td><i class="fas fa-check"></i></td>
                    </tr>
                    <tr>
                        <td>Admision de solicitudes de cambio</td>
                       
                        <td><i class="fas fa-check"></i></td>
                    </tr>
                    <tr>
                        <td>Disponibilidad del soporte</td>
                        <td> 9:00 a 21:00 de lunes a viernes</td>
                    </tr>
                    <tr>
                        <td>Disponibilidad del servicio</td>
                        <td>99%</td>
                    </tr>
                    <tr>
                        <td>
                            <br>90.00 €/ año</br>
                        </td>
                    </tr></c:if>
                
    </table>
</div>

   
</petclinic:layout>