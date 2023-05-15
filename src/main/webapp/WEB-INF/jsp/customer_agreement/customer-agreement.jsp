<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page pageEncoding="UTF-8"%>

<head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" crossorigin="anonymous">
</head>
<style>
    p {font-size:large}
</style>
<petclinic:layout pageName="customer-agreement">

    <h1 style="font-size:xx-large">Acuerdo de cliente</h1>
    <ol style="font-weight: bold; font-size: x-large;">
        <li><h2>Duración</h2>
            <p>
                Este Acuerdo de Cliente estará vigente durante todo el período delimitado desde el 1 de septiembre del año 2022 hasta
                el 28 de diciembre del año 2023, ambos dias incluidos en el periodo.
            </p></li>
        <br>
        <li> 
            <h2>Servicios Asociados</h2>

            <p>
                Comenzado el acuerdo de este contrato, los usuarios de la plataforma petclinic tendran acceso a la plataforma
                como propietario de clínica con el inicio de sesión que hayan introducido y podran acceder a los siguientes servicios:
            </p>
                <ul style="font-size:medium; font-weight: normal;">
                    <li>
                        Servicio de Hotel de Mascotas y Adopciones
                    </li>
                    <li>
                        Servicio de Causas y Donaciones
                    </li>
                    <li>
                        Servicio de Veterinaria
                    </li>
                </ul>
                <br>
            <p>
                Además, todos los usuarios podrán enviar tickets al soporte técnico de Petclinic y solicitar una resolución de 
                incidencias al servicio de petclinic en caso de dificultades técnicas o problemas con el servicio que requieran la 
                atención del equipo de soporte de la plataforma Petclinic.

                Adicionalmente, si el usuario posee el plan "Pro" de Petclinic, podrá solicitar cambios y añadidos para 
                la plataforma que pueden ser considerados a implementar por el equipo y tengan como objetivo mejorar 
                la experiencia del usuario.
            </p>
        </li>
        <br>
        <li>


            <h2>Planes de pago</h2>
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
                        <a href="<c:url value='/users/plan'/>">Comprar ahora</a>
                    </td>
                    <td>
                        <br>90.00 €/ año</br>
                        <a href="<c:url value='/users/plan'/>">Comprar ahora</a>
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
                    <td>Funcionalidad de hotel para mascotas</td>
                    <td><br><i class="fas fa-times"></i></br></td>
                    <td><br><i class="fas fa-check"></i></br></td>
                    <td><br><i class="fas fa-check"></i></br></td>
                </tr>
                <tr>
                    <td>Notificaciones por SMS para visitas</td>
                    <td><br><i class="fas fa-times"></i></br></td>
                    <td><br><i class="fas fa-check"></i></br></td>
                    <td><br><i class="fas fa-check"></i></br></td>
                </tr>
                <tr>
                    <td>Actualización meteorológica diaria por SMS</td>
                    <td><i class="fas fa-times"></i></td>
                    <td><i class="fas fa-times"></i></td>
                    <td><i class="fas fa-check"></i></td>
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
                    <td>Disponibilidad del soporte personal</td>
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
                    <td>
                        <br>TTO</br>
                        <small style="font-size: 12px; font-weight: 400;">Tiempo de asignación a un miembro del equipo de soporte</small>
                    </td>
                    <td>
                        <p>Prioridad baja: 48 horas</p>
                        <p>Prioridad media: 24 horas</p>
                        <p>Prioridad alta: 12 horas</p>
                    </td>
                    <td>
                        <p>Prioridad baja: 36 horas</p>
                        <p>Prioridad media: 18 horas</p>
                        <p>Prioridad alta: 9 horas</p>
                    </td>
                    <td>
                        <p>Prioridad baja: 24 horas</p>
                        <p>Prioridad media: 12 horas</p>
                        <p>Prioridad alta: 6 horas</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br>TTR</br>
                        <small style="font-size: 12px; font-weight: 400;">Tiempo de resolución de incidentes</small>
                    </td>
                    <td>
                        <p>Prioridad baja: 900 horas</p>
                        <p>Prioridad media: 450 horas</p>
                        <p>Prioridad alta: 225 horas</p>
                    </td>
                    <td>
                        <p>Prioridad baja: 672 horas</p>
                        <p>Prioridad media: 336 horas</p>
                        <p>Prioridad alta: 168 horas</p>
                    </td>
                    <td>
                        <p>Prioridad baja: 504 horas</p>
                        <p>Prioridad media: 252 horas</p>
                        <p>Prioridad alta: 126 horas</p>
                    </td>
                </tr>
            </table>
            <p>
                El soporte ofrecido a los usuarios del plan pro se apoya en un chat directo con nuestro equipo de soporte y una línea telefónica en el horario establecido anteriormente.
                Los usuarios de otros planes tendrán soporte a incidentes mediante el portal
            </p>
            <br></br>
        </li>
        
        <li>
            <h2 style="font-size:x-large">Acuerdo a nivel de servicio</h2>

            <ul>
                <li>
                    <h3 style="font-size: large">Objetivos del acuerdo</h3>

                    <p>
                        Este acuerdo a nivel de servicio (“SLA”) rige el uso de el servicio de 
                        PetClinic conforme a las condiciones del Acuerdo de cliente de PetClinic Services 
                        entre PSG2-2223-G5-52 y los usuarios.
                    </p>

                    <br>
                </li>

                <li>
                    <h3 style="font-size: large">Compromiso de servicio</h3>

                    <p>
                        PSG2-2223-G5-52 se compromete en la medida de lo posible a que el servicio tenga Tiempo Total de Asignación 
                        desde que se recibe una petición hasta que se asigna a un miembro del equipo de soporte para su solución ("TTO") 
                        dependiendo del nivel de prioridad y del plan del usuario.
                    </p>

                    <br>
                    <p>Para proporcionar una respuesta eficiente a las incidencias y las peticiones se establecen 
                        tres niveles de prioridad:
                    </p>

                    <ul style="font-size:large; font-weight: normal;">
                        <li>
                            Prioridad baja: Incidencias que ocurren a un número reducido de usuarios, 
                            que causen molestia o producen fallos en la visualización de la página. En el caso de las peticiones,
                            se asigna baja prioridad a aquellas que supongan cambios importantes tras analizar la viabilidad de la 
                            petición.
                        </li>
                        <li>
                            Prioridad media: Incidencias que ocurren a un número moderado de usuarios, que impidan el acceso 
                            a ciertas características del servicio o que pueda provocar pérdidas de datos. En el caso de las peticiones,
                            se asigna prioridad media a aquellas que supongan cambios notables tras analizar la viabilidad de la 
                            petición.
                        </li>
                        <li>
                            Prioridad alta: Incidencias que ocurren a un número elevado de usuarios, que impidan el acceso al 
                            servicio en su totalidad o que pueda provocar la pérdida de todos los datos del servicio. 
                            En el caso de las peticiones,se asigna baja prioridad a aquellas que supongan cambios leves 
                            tras analizar la viabilidad de la petición.
                        </li>
                    </ul>

                    <br>
                    <p>Así, en la siguiente tabla se expresa el TTO al que se compromete la empresa:</p>

                    <table class="table table-striped" border="2">
                        <tr>
                            <tr style="font-size: large" >
                                <td rowspan="3" style="text-align: center;">
                                    Basic
                                </td>
                                <td>
                                    Prioridad baja
                                </td>
                                <td>
                                    Se asignará la petición a un miembro del equipo de soporte en las 48 horas siguientes
                                </td>
                            </tr>
                            <tr style="font-size: large" >
                                <td>
                                    Prioridad media
                                </td>
                                <td>
                                    Se asignará la petición a un miembro del equipo de soporte en las 24 horas siguientes
                                </td>
                            </tr>
                            <tr style="font-size: large" >
                                <td>
                                    Prioridad alta
                                </td>
                                <td>
                                    Se asignará la petición a un miembro del equipo de soporte en las 12 horas siguientes
                                </td>
                            </tr>
                        </tr>
                        <tr>
                            <tr style="font-size: large" >
                                <td rowspan="3" style="text-align: center;">
                                    Advanced
                                </td>
                                <td>
                                    Prioridad baja
                                </td>
                                <td>
                                    Se asignará la petición a un miembro del equipo de soporte en las 36 horas siguientes
                                </td>
                            </tr>
                            <tr style="font-size: large" >
                                <td>
                                    Prioridad media
                                </td>
                                <td>
                                    Se asignará la petición a un miembro del equipo de soporte en las 18 horas siguientes
                                </td>
                            </tr>
                            <tr style="font-size: large" >
                                <td>
                                    Prioridad alta
                                </td>
                                <td>
                                    Se asignará la petición a un miembro del equipo de soporte en las 9 horas siguientes
                                </td>
                            </tr>
                        </tr>
                        <tr>
                            <tr style="font-size: large" >
                                <td rowspan="3" style="text-align: center;">
                                    Pro
                                </td>
                                <td>
                                    Prioridad baja
                                </td>
                                <td>
                                    Se asignará la petición a un miembro del equipo de soporte en las 24 horas siguientes
                                </td>
                            </tr>
                            <tr style="font-size: large" >
                                <td>
                                    Prioridad media
                                </td>
                                <td>
                                    Se asignará la petición a un miembro del equipo de soporte en las 12 horas siguientes
                                </td>
                            </tr>
                            <tr style="font-size: large" >
                                <td>
                                    Prioridad alta
                                </td>
                                <td>
                                    Se asignará la petición a un miembro del equipo de soporte en las 6 horas siguientes
                                </td>
                            </tr>
                        </tr>
                    </table>

                    <br> <br>

                    <p>
                        Además, la empresa también se compromete a que el servicio tenga un Tiempo de Respuesta de la Resolución ("TTR")
                         para las incidencias y las peticiones con el sitio web dependerá del nivel de prioridad y del plan del usuario.
                    </p>

                    <br> 

                    <table class="table table-striped" border="2" >
                        <tr>
                            <tr style="font-size: large" >
                                <td rowspan="3" style="text-align: center;">
                                    Basic
                                </td>
                                <td>
                                    Prioridad baja
                                </td>
                                <td>
                                    Se le dará solución a la petición en las 900 horas siguientes a su asignación
                                </td>
                            </tr>
                            <tr style="font-size: large" >
                                <td>
                                    Prioridad media
                                </td>
                                <td>
                                    Se le dará solución a la petición en las 450 horas siguientes a su asignación
                                </td>
                            </tr>
                            <tr style="font-size: large" >
                                <td>
                                    Prioridad alta
                                </td>
                                <td>
                                    Se le dará solución a la petición en las 225 horas siguientes a su asignación
                                </td>
                            </tr>
                        </tr>
                        <tr>
                            <tr style="font-size: large" >
                                <td rowspan="3" style="text-align: center;">
                                    Advanced
                                </td>
                                <td>
                                    Prioridad baja
                                </td>
                                <td>
                                    Se le dará solución a la petición en las 672 horas siguientes a su asignación
                                </td>
                            </tr>
                            <tr style="font-size: large" >
                                <td>
                                    Prioridad media
                                </td>
                                <td>
                                    Se le dará solución a la petición en las 336 horas siguientes a su asignación
                                </td>
                            </tr>
                            <tr style="font-size: large" >
                                <td>
                                    Prioridad alta
                                </td>
                                <td>
                                    Se le dará solución a la petición en las 168 horas siguientes a su asignación
                                </td>
                            </tr>
                        </tr>
                        <tr>
                            <tr style="font-size: large" >
                                <td rowspan="3" style="text-align: center;">
                                    Pro
                                </td>
                                <td>
                                    Prioridad baja
                                </td>
                                <td>
                                    Se le dará solución a la petición en las 504 horas siguientes a su asignación
                                </td>
                            </tr>
                            <tr style="font-size: large" >
                                <td>
                                    Prioridad media
                                </td>
                                <td>
                                    Se le dará solución a la petición en las 252 horas siguientes a su asignación
                                </td>
                            </tr>
                            <tr style="font-size: large" >
                                <td>
                                    Prioridad alta
                                </td>
                                <td>
                                    Se le dará solución a la petición en las 126 horas siguientes a su asignación
                                </td>
                            </tr>
                        </tr>
                    </table>
                    <br> 
                    <p>En caso de incumplimiento, se aplicarán las siguientes medidas:</p>
                    
                    <ul style="font-size:large; font-weight: normal;">
                        <li>
                            Prioridad baja: 
                            No se dará ninguna compensación.
                        </li>
                        <li>
                            Prioridad media: 
                            Se dará una compensación equivalente al 10% de Créditos de Servicio en caso de incumplimiento.
                        </li>
                        <li>
                            Prioridad alta: 
                            Se dará una compensación equivalente al 20% de Créditos de Servicio en caso de incumplimiento.
                        </li>
                    </ul>

                    <br> <br>

                    <p>
                        Asimismo, la empresa se compromete en la medida de lo posible a que el soporte al cliente 
                        perdure de 9:00 a 21:00 de lunes a viernes para los usuarios que tengan el plan Pro.
                    </p>

                    <br> <br>

                    <p>
                        Finalmente, la empresa se compromete a que el rendimiento de la página web será lo más óptimo posible. 
                        Para ello se establece que el tiempo de carga de la página será inferior a 4 segundos. El seguimiento de 
                        esta métrica se realizará a través de la herramienta Google PageSpeed Insights, que sirve para medir y 
                        analizar la carga en dispositivos móviles y en ordenadores. En caso de incumplimiento, el usuario tendrá 
                        derecho a una compensación equivalente al 5% de créditos de servicio.
                    </p>
                    
                    <br>
                </li>
                <li>
                    <h3 style="font-size: large">Créditos de Servicio</h3>
                    <p>
                        Los Créditos de Servicio se calculan como un porcentaje de la factura mensual del cliente. 
                        La empresa aplicará estos créditos a la siguiente factura en forma de descuento. Los Créditos de Servicio 
                        se aplicarán y emitirán solo si el importe de la factura del mes aplicable es superior a 1 euro. Los Créditos 
                        de Servicio no pueden transferirse ni aplicarse a otra cuenta.
                    </p>

                    <br>
                </li>
                <li>
                    <h3 style="font-size: large">Exclusiones del SLA</h3>
                    <p>
                        El SLA no se aplicará en los siguientes casos:
                    </p>
                    <ol style="font-size:large; font-weight: normal;">
                        <li>
                            Cuando el usuario experimente problemas de conexión a Internet o 
                            relacionados con el hardware/software de su dispositivo.
                        </li>
                        <li>
                            Cuando el problema de rendimiento se deba a una interrupción causada por terceros.
                        </li>
                        <li>
                            Cuando el problema surja de una suspensión o rescisión de los derechos 
                            del usuario a utilizar el servicio, por ejemplo, por el uso inadecuado del sitio web.
                        </li>
                        <li>
                            Cuando el problema de carga de página se deba al cargar por primera vez en el dispositivo del usuario, 
                            debido a que la primera carga puede tardar más tiempo de lo esperado.
                        </li>
                        <li>
                            Cuando el problema de carga de la página se deba a una conexión a Internet lenta o inestable.
                        </li>
                        <li>
                            Cuando la incidencia se deba a una actualización programada del servicio, la cual será anunciada previamente.
                        </li>
                    </ol>
                </li>
            </ul>
        </li>
        <br>
        <br>
        <h6>Última fecha de modificación: 10/05/2023</h6>
        <h6>Nº de versión: 1.2</h6>
    </ol>
    

    


</petclinic:layout>
