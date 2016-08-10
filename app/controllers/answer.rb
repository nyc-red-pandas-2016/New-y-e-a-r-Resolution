post '/answers/:id/comments/new' do
  if current_user
    answer = Answer.find(params[:id])
    question_id = answer.question.id
    answer.comments.create(text: params[:text], user_id: current_user)
    redirect "/questions/#{question_id}"
  else
    redirect '/users/login'
  end
end

get '/answers/:id/upvote' do
  answer = Answer.find(params[:id])
  question_id = answer.question.id
  answer.votes.create(user_id: current_user, value: 1)
  redirect "/questions/#{question_id}"
end

get '/answers/:id/downvote' do
  answer = Answer.find(params[:id])
  question_id = answer.question.id
  answer.votes.create(user_id: current_user, value: -1)
  redirect "/questions/#{question_id}"
end
