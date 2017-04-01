//$(document).ready(function(){
var ready = function(){
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
    $(window).scroll(function(){
        var docScroll = $(window).scrollTop(),
            almostBottom = $(".block-4").offset().top - 100;

        if(docScroll >= almostBottom) {
            $(".back-to-top").fadeIn(200);
        } else {
            $(".back-to-top").fadeOut(200);
        }
    });
    $(".back-to-top").on('click', function(e){
        e.preventDefault();
        $('html, body').stop().animate({
            scrollTop: 0
        }, 1000);
    });
};

$(document).ready(ready);
$(document).on('turbolinks:load', ready);
