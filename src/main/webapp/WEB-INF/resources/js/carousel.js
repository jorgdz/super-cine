$('.carousel.carousel-slider').carousel({
    fullWidth: true,
    indicators: true
});

function autoplay() {
    $('.carousel').carousel('next');
    setTimeout(autoplay, 3500);
}
autoplay();

