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
