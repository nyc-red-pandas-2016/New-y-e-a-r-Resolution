get '/users/new' do
  erb :'/users/register'
end

post '/users/new' do
  user = User.new(params[:user])
  @message = "Account Successfully Created!"
  if user.save
    session[:user_id]= user.id
    redirect '/'
  else
    @errors = user.errors.full_messages
    erb :'/users/register'
  end
end

get '/users/login' do
  erb :'/users/login'
end

post '/users/login' do
  user = User.find_by(email: params[:user][:email])
  if user
    if user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect "/users/profile/#{user.id}"
    else
      @errors = ['Invalid password']
      erb :'users/login'
    end
  else
    @errors = ['We do not recognize this email address']
    erb :'users/login'
  end
end

get '/users/logout' do
  session.clear
  redirect '/'
end

 get '/users/profile/:id' do
  require_user
  @user_id = params[:id]
  @questions= Question.where(user_id: @user_id)
  @answers= Answer.where(user_id: @user_id)
  @comments= Comment.where(user_id: @user_id)
  erb :'/users/profile'
end
