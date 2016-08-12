$(document).ready(function() {

  $("#newest_id").on("click", function(e) {
    e.preventDefault();
    // debugger
    $(e.target).addClass('super_random');
    $("#popular_id a").removeClass('super_random');
    $("#worst_id a").removeClass('super_random');
    $.ajax({
      url: $(e.target).attr('href')
    }).done(function(response){
      $("#all_the_questions").empty();
      $('#all_the_questions').append(response);
    });
  });

  $("#popular_id").on("click", function(e){
    e.preventDefault();
    $(e.target).addClass('super_random');
    $("#newest_id a").removeClass('super_random');
    $("#worst_id a").removeClass('super_random');
    $.ajax({
      url: $(e.target).attr('href')
    }).done(function(response){
      $("#all_the_questions").empty();
      $('#all_the_questions').append(response);
    });
  });


  $("#worst_id").on("click", function(e){
    e.preventDefault();
    $(e.target).addClass('super_random');
    $("#popular_id a").removeClass('super_random');
    $("#newest_id a").removeClass('super_random');
    $.ajax({
      url: $(e.target).attr('href')
    }).done(function(response){
      $("#all_the_questions").empty();
      $('#all_the_questions').append(response);
    });
  });



      $.ajax({
        url: '/tags'
      }).done(function(response){
        var results = JSON.parse(response);
        $("#search_area").autocomplete({
          source: results.map(function(element) {
            return element.name;
          }),
          change: function( event, ui) {
          }
        });
      });



});
