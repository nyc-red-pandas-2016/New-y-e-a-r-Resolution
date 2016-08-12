$(document).ready(function() {
  $('#q_vote_container').on("click", '#question_upvote', function(event) {
    event.preventDefault();
    var questionID = $(".q_a_container").attr('id');
    var request = $.ajax({
      method: "GET",
      url: "/questions/" + questionID + "/upvote"
    });
    request.done(function(response) {
      $('#q_vote_container').find('.current_votes').text(response['votes']);
    });
    request.fail(function(response) {
      alert("You cannot upvote the same question more than once.");
    });
  });

  $('#q_vote_container').on("click", '#question_downvote', function(event) {
    event.preventDefault();
    var questionID = $(".q_a_container").attr('id');
    var request = $.ajax({
      method: "GET",
      url: "/questions/" + questionID + "/downvote"
    });
    request.done(function(response) {
      $('#q_vote_container').find('.current_votes').text(response['votes']);
    });
    request.fail(function(response) {
      alert("You cannot downvote the same question more than once.");
    });
    });

  $('.vote_container').on("click", '#answer_upvote', function(event) {
    event.preventDefault();
    var answerID = $(this).closest('.answer_vote_comment').attr('id');
    var currentVotes = $(this).closest('.vote_container').find('.current_votes')
    var request = $.ajax({
      method: "GET",
      url: "/answers/" + answerID + "/upvote"
    });
    request.done(function(response) {
      debugger
      $(currentVotes).text(response['votes']);
    })
    request.fail(function(response) {
      alert("You cannot upvote the same answer more than once.");
    });
  })

    $('.vote_container').on("click", '#answer_downvote', function(event) {
    event.preventDefault();
    var answerID = $(this).closest('.answer_vote_comment').attr('id');
    var currentVotes = $(this).closest('.vote_container').find('.current_votes')
    var request = $.ajax({
      method: "GET",
      url: "/answers/" + answerID + "/downvote"
    });
    request.done(function(response) {
      debugger
      $(currentVotes).text(response['votes']);
    })
    request.fail(function(response) {
      alert("You cannot downvote the same answer more than once.");
    });
  });

    $('.q_comment_form').submit(function(event) {
      event.preventDefault();
      var questionID = $(".q_a_container").attr('id');
      $.ajax({
        method: $(event.target).attr("method"),
        url: "/questions/" + questionID + "/comments/new",
        data: $(event.target).serialize()
      }).done(function(response) {
        $(".q_comment_list").append(response);
        $(".comment_field").val('');
      });

    });

  $('.answer_vote_comment').on("submit", '.a_comment_form', function(event) {
    event.preventDefault();
    var answerID = $(this).closest('.answer_vote_comment').attr('id');
    $.ajax({
      method: $(event.target).attr("method"),
      url: "/answers/" + answerID + "/comments/new",
      data: $(event.target).serialize()
      }).done(function(response) {
        $(".a_comment_list").append(response);
        $(".comment_field").val('');
      });
    });
});
