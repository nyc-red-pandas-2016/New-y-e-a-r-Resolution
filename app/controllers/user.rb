get '/users/new' do
  erb :'/users/register'
end

post '/users/new' do
  user = User.new(params[:user])
  @message = "Accout Successfully Created!"
  if user.save
    session[:user_id]= user.id
    erb :'index'
  else
    @errors = user.errors.full_messages
    erb :'/users/register'
  end
end

get '/users/login' do
  erb :'/users/login'
end

post '/users/login' do
  @user= User.find_by(email: params[:user][:email])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id]= @user.id
    erb :'index'
  else
    @errors= ["Cannot Log In With This Info"]
    erb :'users/login'
  end
end

get '/users/logout' do
  session.clear
  erb :'index'
end
