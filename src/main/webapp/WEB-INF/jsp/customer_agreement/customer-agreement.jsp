<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page pageEncoding="UTF-8"%>

<style>
    p {font-size:large}
</style>
<petclinic:layout pageName="customer-agreement">

    <h1 style="font-size:xx-large">Acuerdo de cliente</h1>
    <ol style="font-weight: bold; font-size: x-large;">
        <li></li>
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
                        PSG2-2223-G5-52 se compromete en la medida de lo posible a que el Tiempo Total de Asignación desde que se 
                        recibe una petición hasta que se asigna a un trabajador para su solución ("TTO") sea menor a dos horas. 
                    </p>

                    <br> <br>

                    <p>
                        Además, la empresa también se compromete a que el servicio tenga un Tiempo de Respuesta de la Resolución ("TTR")
                         para las incidencias con el sitio web dependerá del nivel de prioridad.
                    </p>

                    <br> 

                    <p>Para proporcionar una respuesta eficiente a las incidencias se establecen tres niveles de prioridad:</p>

                    <ul style="font-size:large; font-weight: normal;">
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
                    
                    <ul style="font-size:large; font-weight: normal;">
                        <li>
                            Prioridad baja: Se proporcionará una solución permanente en las 672 horas siguientes. 
                            No se dará ninguna compensación.
                        </li>
                        <li>
                            Prioridad media: Se proporcionará una solución permanente en las 336 horas siguientes. 
                            Se dará una compensación equivalente al 10% de Créditos de Servicio en caso de incumplimiento.
                        </li>
                        <li>
                            Prioridad alta: Se proporcionará una solución permanente en las 168 horas siguientes. 
                            Se dará una compensación equivalente al 20% de Créditos de Servicio en caso de incumplimiento.
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
    </ol>
    

    


</petclinic:layout>