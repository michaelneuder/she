$(document).ready(function(){
    $(".back-to-top").hide();
    $("#what").on('click', function(e){
        e.preventDefault();
        $('html, body').stop().animate({
            scrollTop: $(".block-2").offset().top
        }, 1000);
    });
    $("#how").on('click', function(e){
        e.preventDefault();
        $('html, body').stop().animate({
            scrollTop: $(".block-3").offset().top
        }, 1000);
    });
    $("#signup").on('click', function(e){
        e.preventDefault();
        $('html, body').stop().animate({
            scrollTop: $(".block-4").offset().top
        }, 1000);
    });
    $(document).scroll(function(){
        var docScroll = $(document).scrollTop(),
            almostBottom = $(".block-4").offset().top - 100;

        if(docScroll >= almostBottom) {
            $(".back-to-top").fadeIn(200);
        } else {
            $(".back-to-top").fadeOut(200);
        }
    });
});
