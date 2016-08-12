$(document).ready(function() {

  $("#newest_id").on("click", function(e) {
    e.preventDefault();
    $.ajax({
      url: $(e.target).attr('href')
    }).done(function(response){
      $("#all_the_questions").empty();
      $('#all_the_questions').append(response);
    });
  });

  $("#popular_id").on("click", function(e){
    e.preventDefault();
    $.ajax({
      url: $(e.target).attr('href')
    }).done(function(response){
      $("#all_the_questions").empty();
      $('#all_the_questions').append(response);
    });
  });


  $("#worst_id").on("click", function(e){
    e.preventDefault();
    $.ajax({
      url: $(e.target).attr('href')
    }).done(function(response){
      $("#all_the_questions").empty();
      $('#all_the_questions').append(response);
    });
  });



});
