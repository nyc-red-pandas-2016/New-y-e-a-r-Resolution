$(document).ready(function() {
  var defaultActive= $('.tabs .active').find('a').attr('href');
  $(defaultActive).show();

  $('.tabs li').click(function(){
    $('.tabs li').removeClass("active");
    $(this).addClass("active");
    $('.tab-content').hide();

    var tabText= $(this).find('a').attr('href');
    $(tabText).show();

  });
});
