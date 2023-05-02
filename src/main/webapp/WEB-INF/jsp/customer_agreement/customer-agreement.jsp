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
    p {font-size:medium}
</style>
<petclinic:layout pageName="customer-agreement">

    <h1>Acuerdo de cliente</h1>
    <ol style="font-weight: bold; font-size: large;">
        <li></li>
        <li>
            <h2>Duración</h2>
            <p>
                Este Acuerdo de Cliente estará vigente durante todo el período delimitado desde el 1 de septiembre del año 2022 hasta
                el 28 de diciembre del año 2023, esos dias incluidos en el periodo.
            </p>

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
                        <a href="#">Comprar ahora</a>
                    </td>
                    <td>
                        <br>90.00 €/ año</br>
                        <a href="#">Comprar ahora</a>
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
            </table>
            <p>
                El soporte ofrecido a los usuarios del plan pro se apoya en un chat directo con nuestro equipo de soporte y una línea telefónica en el horario establecido anteriormente.
            </p>
        </li>
        <li>
            <h2>Acuerdo a nivel de servicio</h2>

            <ul>
                <li>
                    <h3>Objetivos del acuerdo</h3>

                    <p>
                        Este acuerdo a nivel de servicio (“SLA”) rige el uso de el servicio de 
                        PetClinic conforme a las condiciones del Acuerdo de cliente de PetClinic Services 
                        entre PSG2-2223-G5-52 y los usuarios.
                    </p>

                    <br>
                </li>

                <li>
                    <h3>Compromiso de servicio</h3>

                    <p>
                        PSG2-2223-G5-52 se compromete a que PetClinic Service esté disponible en un porcentaje mayor al 99%, 
                        esto es que el Tiempo Total de Inactividad (“TTO”) será inferior inferior al 1% . 
                        En caso de incumplimiento del SLA, usted podrá recibir un Crédito de Servicio como se describe más adelante:
                    </p>

                    <br>

                    <table class="table table-striped" style="font-size: 83%;">
                        <thead>
                            <tr>
                                <th>Porcentaje de Tiempo Total de Inactividad del servicio</th>
                                <th>Porcentaje de Crédito de servicio</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>Superior al 1% e inferior al 3,5%</td>
                                <td>35%</td>
                            </tr>
                            <tr>
                                <td>Superior al 3,5% e inferior al 7%</td>
                                <td>60%</td>
                            </tr>
                            <tr>
                                <td>Superior al 7%</td>
                                <td>100%</td>
                            </tr>
                        </tbody>
                    </table>

                    <br> <br>

                    <p>
                        Además, la empresa también se compromete a que el servicio tenga un Tiempo de Respuesta de la Resolución (“TTR”)
                         para las incidencias con el sitio web dependerá del nivel de prioridad.
                    </p>

                    <br> 

                    <p>Para proporcionar una respuesta eficiente a las incidencias se establecen tres niveles de prioridad:</p>

                    <ul style="font-size:medium; font-weight: normal;">
                        <li>
                            Prioridad baja: Incidencias que ocurren a un número reducido de usuarios, 
                            que causen molestia o producen fallos en la visualización de la página.
                        </li>
                        <li>
                            Prioridad media: Incidencias que ocurren a un número moderado de usuarios, que impidan el acceso 
                            a ciertas características del servicio o que pueda provocar pérdidas de datos.
                        </li>
                        <li>
                            Prioridad alta: Incidencias que ocurren a un número elevado de usuarios, que impidan el acceso al 
                            servicio en su totalidad o que pueda provocar la pérdida de todos los datos del servicio.
                        </li>
                    </ul>

                    <br>

                    <p>En caso de incumplimiento, se aplicarán las siguientes medidas:</p>
                    
                    <ul style="font-size:medium; font-weight: normal;">
                        <li>
                            Prioridad baja: Se proporcionará una solución temporal en las 12 horas siguientes a la 
                            identificación de la incidencia, y una solución permanente en las 72 horas siguientes. 
                            No se dará ninguna compensación.
                        </li>
                        <li>
                            Prioridad media: Se proporcionará una solución temporal en las 8 horas siguientes a la identificación de la incidencia, 
                            y una solución permanente en las 48 horas siguientes. Se dará una compensación equivalente al 10% de 
                            Créditos de Servicio.
                        </li>
                        <li>
                            Prioridad alta: Se proporcionará una solución temporal en las 4 horas siguientes a 
                            la identificación de la incidencia, y una solución permanente en las 24 horas siguientes. 
                            Se dará una compensación equivalente al 20% de Créditos de Servicio.
                        </li>
                    </ul>

                    <br> <br>

                    <p>
                        Asimismo, la empresa se compromete en la medida de lo posible a que el soporte al cliente 
                        perdure de 9:00 a 21:00 de lunes a viernes para los usuarios que tengan el plan PRO.
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
                    <h3>Créditos de Servicio</h3>
                    <p>
                        Los Créditos de Servicio se calculan como un porcentaje de la factura mensual del cliente. 
                        La empresa aplicará estos créditos a la siguiente factura en forma de descuento. Los Créditos de Servicio 
                        se aplicarán y emitirán solo si el importe de la factura del mes aplicable es superior a 1 euro. Los Créditos 
                        de Servicio no pueden transferirse ni aplicarse a otra cuenta.
                    </p>

                    <br>
                </li>
                <li>
                    <h3>Exclusiones del SLA</h3>
                    <p>
                        El SLA no se aplicará en los siguientes casos:
                    </p>
                    <ol style="font-size:medium; font-weight: normal;">
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
    </ol>
    

    


</petclinic:layout>
