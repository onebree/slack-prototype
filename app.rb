require 'sinatra'
require 'slim'

set :views, "views"
enable :sessions

get "/" do
  slim :mockup
end
