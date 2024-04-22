// static/js/main.js
document.addEventListener('DOMContentLoaded', function() {
    setInterval(() => {
        const currentTime = new Date().toLocaleTimeString();
        document.getElementById('current-time').textContent = currentTime;
    }, 1000);
});
