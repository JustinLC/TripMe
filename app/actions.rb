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

get '/logout' do 
	session[:user_id] = nil
	redirect '/'
end 

get '/signup' do 
	@user = User.new
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
	if current_user
	erb :'trips/dashboard' 
	else 
		redirect '/'
	end 
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
	redirect '/mytrips'
end 

get '/mytrips' do 
	@user = current_user
	erb :'/trips/mytrips'
end 

get '/mytrips/:id' do 
	@user = current_user
	@trip = @user.trips.find(params[:id])
	@comments = Comment.all 
	erb :'trips/eachtrip'
end 

post '/mytrips/:id/comments/new' do 
	@comment = Comment.new(
		url: params[:url],
		comment: params[:comment]
	)
	@comment.save!
	@user = current_user
	@trip = @user.trips.find(params[:id])
	redirect ('/mytrips/' + params[:id].to_s)
end 

get '/alltrips/:id' do 
	@user = current_user
	@trip = @user.trips.find(params[:id])
	erb :'/trips/singletrip'
end 

post '/alltrips/:id/vote' do
  @trip = Trip.find params[:id]
  @trip.up_vote
  redirect "/alltrips"
end

post '/mytrips/:id/vote' do
  @trip = Trip.find params[:id]
  @trip.up_vote
  redirect "/mytrips"
end

get '/alltrips/:id/delete' do
  @trip = Trip.find(params[:id])
	@trip.destroy
  redirect "/mytrips"
end
