get '/questions/create' do
  erb :'/questions/create'
end

post '/questions/create' do
  question = Question.new(params[:question])
  tags = params[:tags].split(' ')
  if tags.length > 0
    tags.map! do |tag|
      new_tag = Tag.find_or_create_by(name: tag.capitalize)
      question.tags << new_tag
    end
  end

  # tags.each do |tag|
  #   QuestionTag.create(question_id: @question.id, tag_id: tag.id)
  # end


  if question.save
    redirect '/'
  else
    @errors = questions.errors.full_messages
    erb :'/questions/create'
  end
end

get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  @tag_names = @question.tags.map { |tag| tag.name }.join(' ')
  erb :'questions/edit'
end

post '/questions/:id/edit' do
  @question = Question.find(params[:id])
  @question.update(params[:question])
  @question.tags.destroy_all
  tags = params[:tags].split(' ')
  if tags.length > 0
    tags.map! do |tag|
      new_tag = Tag.find_or_create_by(name: tag.capitalize)
      @question.tags << new_tag
    end
  end
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @errors = questions.errors.full_messages
    erb :"/questions/#{@question.id}/edit"
  end
end

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

get '/questions/:id/upvote' do
  question = Question.find(params[:id])
  question.votes.create(user_id: current_user, value: 1)
  redirect "/questions/#{question.id}"
end

get '/questions/:id/downvote' do
  question = Question.find(params[:id])
  question.votes.create(user_id: current_user, value: -1)
  redirect "/questions/#{question.id}"
end
