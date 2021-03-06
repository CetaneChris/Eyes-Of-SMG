function startTimer(duration, display) {
    var timer = duration, hours, minutes, seconds;
    setInterval(function () {
    	hours = parseInt(timer / 3600, 10);
        minutes = parseInt( (timer-(hours*3600))/60, 10);
        seconds = parseInt(timer % 60, 10);
        hours = hours < 10 ? hours : hours;
        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.style.fontSize = "26px";
        display.textContent = hours + ":" + minutes + ":" + seconds;
        --timer;

        if (timer == 0)
            location.reload(1);
    }, 1000);
}