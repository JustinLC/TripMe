# Homepage (Root path)
helpers do 
	def current_user 
		if session[:user_id]
			User.find(session[:user_id])
		else 
			nil 
		end 
	end 
end 

get '/' do
  erb :splash
end

post '/' do 
		@user=User.find_by(email: params[:email])
	if @user && @user.password == params[:password]
		session[:user_id] = @user.id 
		redirect '/dashboard'
	else 
		erb :'splash'
	end 
end

get '/login' do 
  erb :'splash'
end

post '/login' do 
  @user=User.find_by(email: params[:email])
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id 
    redirect '/dashboard'
  else 
    erb :'splash'
  end 
end

post '/logout' do 
  session[:user_id] = nil
  redirect '/'
end

get '/signup' do 
	@user = User.new(
		name: params[:name], 
		email: params[:email],
		password: params[:password]
	)
	@user.save
	erb :'/user/signup'
end 

post '/signup' do
	@user = User.new(
	name: params[:name], 
	email: params[:email],
	password: params[:password]
	)
	if @user.save
		redirect '/dashboard' 
	else 
		erb :'/user/signup'
	end 
end

get '/dashboard' do 
	erb :'trips/dashboard'
end

get '/alltrips' do 
end 

get 'alltrips/id/:id' do 
	#specific trip 
end 

get '/create_trip/user/:name' do 
end 

get '/mytrips' do 
end 








