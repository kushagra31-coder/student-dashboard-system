window.addEventListener('DOMContentLoaded', function () {
    var links = document.querySelectorAll('.app-nav a');
    var current = window.location.pathname;
    links.forEach(function (link) {
        if (link.href.indexOf(current) !== -1 || current.indexOf(link.getAttribute('href')) !== -1) {
            link.classList.add('active');
        }
    });
});
