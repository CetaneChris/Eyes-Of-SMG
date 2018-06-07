/*
 *   CC BY-NC-AS UTA FabLab 2016-2017
 *   FabApp V 0.9
 */
//check forms for proper types
function startTimer(duration, display, dg_parent) {
    var timer = duration, hours, minutes, seconds;
    setInterval(function () {
        if (timer > 0) {
            hours = parseInt(timer / 3600, 10);
            minutes = parseInt( (timer-(hours*3600))/60, 10);
            seconds = parseInt(timer % 60, 10);
            hours = hours < 10 ? hours : hours;
            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds : seconds;

            display.textContent = hours + ":" + minutes + ":" + seconds;
            --timer;
        } else {
            hours = Math.abs(parseInt(timer / 3600, 10));
            minutes = Math.abs(parseInt( (timer+(hours*3600))/60, 10));
            seconds = Math.abs(parseInt(timer % 60, 10));
            hours = hours < 10 ? hours : hours;
            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds : seconds;

            display.textContent = "- "+ hours + ":" + minutes + ":" + seconds;
            display.className="message";
            --timer;
        }

        if (timer == 0 && dg_parent == 1)
            window.location.reload(1);
    }, 1000);
}