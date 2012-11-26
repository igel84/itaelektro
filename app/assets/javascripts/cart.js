$(function(){
  $('#slide').timerGallery({idPre: 'img' , interval : '4000' });
});
$(function(){
  $('.wrapper_enter_site > a:first').click(function(){
    var widthWindow = $(document).height();
    $('.pop-up_wrapper').height(widthWindow).show();

    var x = document.documentElement.clientHeight;
    var y = $('.pop-up_registration').height();
    var inTwoX = x/2;
    var inToY = y/2;
    var z = (inTwoX-inToY);
    $('.pop-up_registration').css({'top' : z});
  });
  $('.title_pop-up .close_pop-up_button').click(function(){
    $('.pop-up_wrapper').hide();
  });
});