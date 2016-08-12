get '/' do
  @questions = Question.all.order( :created_at )
  erb :index
end

# this is for the New tab on home page
get '/questions/newest' do
  @questions = Question.all.order( :created_at )
  if request.xhr?
    erb :all_questions, locals: { questions: @questions}, layout: false
  else
    erb :index
  end
end

get '/questions/popular' do
  @questions = Question.all.order( :views).reverse
  if request.xhr?
    erb :all_questions, locals: { questions: @questions}, layout: false
  else
    erb :index
  end
end

get '/questions/worst' do
  questions = Question.all
  @questions = questions.sort_by{ |q| q.votes.map(&:value).reduce(0, :+)}
  if request.xhr?
    erb :all_questions, locals: {questions: @questions}, layout: false
  else
    erb :index
  end
end


get '/questions/by/tag/:id' do
  @questions = Tag.find(params[:id]).questions

 erb :index
end



get '/tags' do
  # @tags = Tag.all.pluck(:name)
    @tags = Tag.all
    puts @tags.to_json
  if request.xhr?
    @tags.to_json
  end
end
