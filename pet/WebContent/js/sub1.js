
        $(document).ready(function(){
            var owl = $('.owl-carousel');
            owl.owlCarousel({
                item:3,
                loop:true,
                margin:50,
                autoplay:true,
                autoplayTimeout:3000,
                autoplayHoverPause:true
                
            });
            $('.play').on('click',function(){
                owl.trigger('play.owl.autoplay',[1000])
            })
            $('.stop').on('click',function(){
                owl.trigger('stop.owl.autoplay')
            })


            // art2 팝업
            $('.v_trigger01').on('click', function(){
                $('#popup01').toggleClass('open');
                $('.sub2_art2_bg_info').toggleClass('blur-it');
                return false;
            });
            $('.v_trigger02').on('click', function(){
                $('#popup02').toggleClass('open');
                $('.sub2_art2_bg_info').toggleClass('blur-it');
                return false;
            });
            $('.v_trigger03').on('click', function(){
                $('#popup03').toggleClass('open');
                $('.sub2_art2_bg_info').toggleClass('blur-it');
                return false;
            }); 
        });