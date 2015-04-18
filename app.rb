require 'bundler'
Bundler.require()

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'chirp_chirp'
)

require './models/user'
require './models/chirp'

#routes
get '/' do
  erb :index
end


#gets all the users
get '\api\users' do
  content_type :json
  user = User.all
  user.to_json
end

#gets an specific user
get '\api\users\:id'
  content_type :json
  user = User.find(params[:id].to_i)
  user.to_json
end
#make a new user
post '\api\users'
  content_type :json
  user = User.create(params[:user])
  user.to_json
end

put '\api\users\:id' do
  content_type :json
  user = User.find(params[:id].to_i)
  user.update(params[:user])
  user.to_json
end


patch '\api\users\:id' do
  content_type :json
  user = User.find(params[:id].to_i)
  user.update(params[:user])
  user.to_json
end


delete '\api\users\:id' do
  content_type :json
  user = User.find(params[:id].to_i)
  {info: 'Successfully Deleted!'}.json
end


# get \api\users\:user_id\chirps
# A specific user's chirps
#
# get \api\users\:user_id\chirps\:id
# A specific user's specific chirp
#
# post \api\users\:user_id\chirps
# Create a Chirp for a user
#
# put \api\users\:user_id\chirps\:id
# Update a user's existing chirp
#
# patch \api\users\:user_id\chirps\:id
# Update a user's existing chirp
#
# delete \api\users\:user_id\chirps\:id
# Delete a user's existing chirp
