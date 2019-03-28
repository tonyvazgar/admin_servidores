Para la actividad de este laboratorio, se requiere que implementen microservicio de un servidor de horas en conjunto con un cliente desacoplado. 
Ambos deberan estar implementados usando contenedores docker y deberá orquestar su creación usando docker compose.


Nota: Utilize la implementación realizada como tarea de la clase de teoría.

--------------------------------------------------------------------------------------------------
El cliente da página con relojes en http://0.0.0.0:80/
     |
     |
     |---->Toma la hora de http://0.0.0.0:3000/
