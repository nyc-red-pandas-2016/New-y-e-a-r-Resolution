$(document).ready(function() {
  $('.question_vote_container').on("click", '#question_upvote', function(event) {
    event.preventDefault();
    var questionID = $(".question_container").attr('id');
    var request = $.ajax({
      method: "GET",
      url: "/questions/" + questionID + "/upvote"
    });
    request.done(function(response) {
      $('.question_vote_container').find('#current_votes').text(response['votes']);
    });
    request.fail(function(response) {
      alert("You cannot upvote the same question more than once.");
    });
  });

  $('.question_vote_container').on("click", '#question_downvote', function(event) {
    event.preventDefault();
    var questionID = $(".question_container").attr('id');
    var request = $.ajax({
      method: "GET",
      url: "/questions/" + questionID + "/downvote"
    });
    request.done(function(response) {
      $('.question_vote_container').find('#current_votes').text(response['votes']);
    });
    request.fail(function(response) {
      alert("You cannot downvote the same question more than once.");
    });
    });

  // $('.answers_container').on("click", '')

});
