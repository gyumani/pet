$(document).ready(function(){
    var owl = $('.owl-carousel');
    
    owl.owlCarousel({
        items:3,
        loop:true,
        margin:50,
        autoplay:true,
        autoplayTimeout:3000,
        autoplayHoverPause:true,
        responsive: {
        0:{items:1},
        600:{items:1},
        720:{items:2},
        1200:{items:3}
        }
    });
});
           