# Homepage (Root path)
get '/' do
	@user = User.new(
		name: params[:name], 
		email: params[:email],
	)
  erb :splash
end

get '/signup' do 
end 

get '/dashboard' do
	erb :'/trips/dashboard'
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








