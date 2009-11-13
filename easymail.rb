require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'lib/partials'
include Sinatra::Partials

set :haml, {:format => :html5 } # default Haml format is :xhtml
set :sass, {:format => :html5 } # default Haml format is :


helpers do
end

get '/favicon.ico' do
end
 
get '/styles/:style.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :"styles/#{params[:style].to_sym}"
end
 
get '/' do
  haml :index
end

not_found do
  haml :'404'
end

error do
  haml :'500'
end
