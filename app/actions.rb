# Homepage (Root path)
helpers do 
	def current_user
		User.find(session[:user_id]) if session[:user_id]  
	end 
end 

get '/' do
  erb :splash
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

get '/logout' do 
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
		session[:user_id] = @user.id 
		redirect '/dashboard' 
	else 
		erb :'/user/signup'
	end 
end

get '/dashboard' do 
	erb :'trips/dashboard'
end 

get '/alltrips' do 
	@trips = Trip.all 
	erb :'/trips/alltrips'
end 

get '/create_trip/user' do 
	@trip=Trip.all
	erb :'/trips/createtrip'
end 

post '/create_trip/user' do 
	@user= current_user 
	@trip= @user.trips.create(
	tripname: params[:tripname],
  destination: params[:destination],
  startdate: params[:startdate],
  enddate: params[:enddate]
	)
	redirect '/create_trip/user'
end 

get '/mytrips' do 
	@user = current_user
	erb :'trips/mytrips'
end 

get '/mytrips/:id' do 
	@trip = Trip.find(params[:id])
	erb :'trips/mytrips'
end 

get '/alltrips' do 
	erb :'/trips/alltrips'
end 

get 'alltrips/id/:id' do 
	#specific trip 
end 

# <form method="post" action="<%="/songs/" + @song.id.to_s + "/comments/new" %>">
# 	<textarea class="form-control" name="comment" rows="3" cols="5"></textarea>
# 	<button class="btn btn-default" type="submit">Post Comment</button>
# </form>


# post '/songs/:id/comments/new' do 
# 	@comment = Comment.new(
# 		comment: params[:comment]
# 	)
# 	@comment.save 
# 	@song=Song.find(params[:id])
# 	redirect ('/songs/' + params[:id].to_s)
# end 
