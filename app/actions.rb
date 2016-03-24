# Homepage (Root path)
get '/' do
	@user = User.new(
		name: params[:name], 
		email: params[:email],
		password: params[:password]
	)
	@user.save

  erb :splash
end

get '/signup' do 
end 

post '/signup' do
  "Hello World"
end

get '/dashboard' do 
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








