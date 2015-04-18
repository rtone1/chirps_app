require 'bundler'
Bundler.require()

ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'chirp_chirp'
)


require './models/chirp'
require './models/user'

#routes
get '/' do
  erb :index
end
#gets all the users
get '/api/users' do
  content_type :json
  user = User.all
  user.to_json
end
#gets an specific user
get '/api/users/:id' do
  content_type :json
  user = User.find(params[:id].to_i)
  user.to_json
end
#make a new user
post '/api/users' do
  content_type :json
  user = User.create(params[:user])
  user.to_json
end
#update a specific user
put '/api/users/:id' do
  content_type :json
  user = User.find(params[:id].to_i)
  user.update(params[:user])
  user.to_json
end
#update a specific user
patch '/api/users/:id' do
  content_type :json
  user = User.find(params[:id].to_i)
  user.update(params[:user])
  user.to_json
end
#delete a specific user
delete '/api/users/:id' do
  content_type :json
  User.delete(params[:id].to_i)
  {message: 'Successfully Deleted!'}.to_json
end

#chirps routes
# A specific user's chirps
get '/api/users/:user_id/chirps' do
  content_type :json
  user = User.find(params[:user_id].to_i)
  chirps = user.chirps
  chirps.to_json
end
# get \api\users\:user_id\chirps\:id
# A specific user's specific chirp
get '/api/users/:user_id/chirps/:id' do
  content_type :json
  user = User.find(params[:user_id].to_i)
  chirp = user.chirps.find(params[:id].to_i)
  chirp.to_json
end
# Create a Chirp for a user
post '/api/users/:user_id/chirps' do
  content_type :json
  user = User.find(params[:user_id].to_i)
  chirp = Chirp.create(params[:chirp])
  user.chirps << chirp
  chirp.to_json
end
# Update a user's existing chirp
put '/api/users/:user_id/chirps/:id' do
  content_type :json
  chirp = Chirp.find(params[:id].to_i)
  chirp.update(params[:chirp])
  chirp.to_json
end
# Update a user's existing chirp
patch '/api/users/:user_id/chirps/:id' do
  content_type :json
  chirp = Chirp.find(params[:id].to_i)
  chirp.update(params[:chirp])
  chirp.to_json
end
# Delete a user's existing chirp
delete '/api/users/:user_id/chirps/:id' do
  content_type :json
  user = User.find(params[:user_id].to_i)
  chirp = user.chirps.delete(params[:id].to_i)
  {message: 'you delete a chirp'}.to_json
end
