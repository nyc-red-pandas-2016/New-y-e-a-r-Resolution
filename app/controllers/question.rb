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

post '/questions/:id/delete' do
  @question = Question.find(params[:id])
  @question.destroy
  @question.save
  redirect "/users/profile/#{current_user}"
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  best = @question.answers.where(best: true)
  rest = @question.answers.where(best: false).sort_by{|an| an.count_votes}.reverse
  @answers = best + rest
  @question.add_view
  @best_enabled = true if @question.user.id == current_user

  erb :'questions/show'
end

post '/questions/:id/comments/new' do
  question = Question.find(params[:id])

  if current_user
    question = Question.find(params[:id])
    comment = question.comments.create(text: params[:text], user_id: current_user)
    if request.xhr?
      erb :'comments/_new_comment', locals:{comment: comment}, layout: false
    else
      redirect "/questions/#{question.id}"
    end
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
  if current_user
    question = Question.find(params[:id])
    question.votes.new(user_id: current_user, value: 1)
    if request.xhr? && question.save
      content_type :json
      {votes: question.count_votes}.to_json
    elsif request.xhr?
      status 400
    else
      redirect "/questions/#{question.id}"
    end
  else
    redirect '/users/login'
  end
end

get '/questions/:id/downvote' do
  if current_user
    question = Question.find(params[:id])
    question.votes.new(user_id: current_user, value: -1)
    if request.xhr?
      content_type :json
      {votes: question.count_votes}.to_json
    elsif request.xhr?
      status 400
    else
      redirect "/questions/#{question.id}"
    end
  else
    redirect '/users/login'
  end
end
