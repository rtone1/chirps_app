require 'bundler'
Bundler.require()

ActiveRecord::Base.establish_connection(
  :adapter 'postgresql',
  :database 'chirp_chirp'
)

require './models/user'
require './models/chirp'

get '/' do
  erb :index
end
