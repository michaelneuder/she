$(document).ready(function(){
  console.log('This worked at least');
  // $('.test').on('click', function(){
  //   $('.test').css('color', 'red');
  // });
  $('.right-arrow').on('click', function(){
    $show = $('.is-showing');
    $show.addClass('out');
    if($show.hasClass('second')){
      $('.right-arrow').addClass('out');
    }
    setTimeout(function(){
      $show.addClass('is-hidden');
      $show.removeClass('is-showing');
      $show.next().addClass('in');
      $show.next().addClass('is-showing');
      $show.next().removeClass('is-hidden');
      if($show.hasClass('first')){
        console.log('Clicked on first');
        $('.left-arrow').addClass('in');
        $('.left-arrow').addClass('arrow-showing');
        $('.left-arrow').removeClass('arrow-hidden');
      }
      if($show.hasClass('second')){
        $('.right-arrow').addClass('arrow-hidden');
        $('.right-arrow').removeClass('arrow-showing');
      }
    }, 500);
  });
});
