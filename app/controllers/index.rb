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
