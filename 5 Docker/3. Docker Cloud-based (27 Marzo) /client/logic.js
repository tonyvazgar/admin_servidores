/**
 * Luis Antonio Vázquez García
 * ---------------------------
 * Archivo para representar el cliente mediante la llamada de AJAX al cliente
 * ubicado en http://localhost:3000/ 
 */

var local_clock = document.getElementById('local_clock');
var server_clock = document.getElementById('server_clock');

/**
 * Function to get the current date of the client
 * and display it in the screen
 */
function localClock(){
    var time = new Date();
    local_clock.textContent = "Local Time: " + dateToString(time);
    local_clock.style.color = "#" + time.getMilliseconds().toString();
}

/**
 * Function to get the date of the server located in the specified
 * url
 */
function serverClock() { 
    $.ajax({
        type: 'GET', 
        url: 'http://localhost:3000'}).done(function(date){
            console.log(date);
            var time = new Date(date);
            server_clock.textContent = "Server Time: " + dateToString(time);
            server_clock.style.color = "#" + time.getMilliseconds().toString();
    });
}

/**
 * Recieves the given date and convert it to a string with a format
 * @param {*} date 
 */
function dateToString(date){
    var hours = date.getHours().toString();
    var mins = twodigits(date.getMinutes().toString());
    var seconds = twodigits(date.getSeconds().toString());
    return hours + ":" + mins + ":" + seconds;
}

/**
 * Function to make the mins/secs in two digits when
 * are less han 10 secs
 * @returns {string}
 */
function twodigits(digits){
    if(digits.length < 2){
        digits = '0' + digits;
    }
    return digits;
}

/**
 * Function to update the local and server clock
 */
function initialize(){
    localClock();
    serverClock();
}

initialize();
setInterval(initialize, 1000);  //Initialization of the clocks and update it each 1000 millisecs