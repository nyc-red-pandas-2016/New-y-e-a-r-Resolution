get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  @question.add_view

  erb :'questions/show'
end

post '/questions/:id/comments/new' do
  question = Question.find(params[:id])

  if current_user
    question = Question.find(params[:id])
    question.comments.create(text: params[:text], user_id: current_user)
    redirect "/questions/#{question.id}"
  else
    redirect '/users/login'
  end
end

post '/questions/:id/answers/new' do
  if current_user
    question = Question.find(params[:id])
    question.answers.create(text: params[:text], user_id: current_user)
    redirect "/questions/#{question.id}"
  else
    redirect '/users/login'
  end

end
