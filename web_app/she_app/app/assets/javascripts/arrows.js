$(document).ready(function(){
  console.log('This worked at least');

  //The right arrow code
  $('.right-arrow').on('click', function(){
    $show = $('.is-showing');
    $show.addClass('out');
    if($show.hasClass('second')){
      $('.right-arrow').children().addClass('out');
    }
    setTimeout(function(){
      $show.addClass('is-hidden');
      $show.removeClass('is-showing');
      $show.next().addClass('in');
      $show.next().addClass('is-showing');
      $show.next().removeClass('is-hidden');
      if($show.hasClass('first')){
        $('.left-arrow').children().addClass('in');
        $('.left-arrow').children().addClass('arrow-showing');
        $('.left-arrow').children().removeClass('arrow-hidden');
      }
      if($show.hasClass('second')){
        $('.right-arrow').children().addClass('arrow-hidden');
        $('.right-arrow').children().removeClass('arrow-showing');
      }
    }, 500);
  });

  //The left arrow code
  $('.left-arrow').on('click', function(){
    $show = $('.is-showing');
    $show.addClass('out');
    if($show.hasClass('second')){
      $('.left-arrow').children().addClass('out');
    }
    setTimeout(function(){
      $show.addClass('is-hidden');
      $show.removeClass('is-showing');
      $show.prev().addClass('in');
      $show.prev().addClass('is-showing');
      $show.prev().removeClass('is-hidden');
      if($show.hasClass('third')){
        $('.right-arrow').children().addClass('in');
        $('.right-arrow').children().addClass('arrow-showing');
        $('.right-arrow').children().removeClass('arrow-hidden');
      }
      if($show.hasClass('second')){
        $('.left-arrow').children().addClass('arrow-hidden');
        $('.left-arrow').children().removeClass('arrow-showing');
      }
    }, 500);
  });
});
