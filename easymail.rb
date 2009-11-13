#!/usr/bin/ruby

require 'rubygems'
require 'sinatra'

require 'haml'
require 'sass'
set :haml, {:format => :html5 } # default Haml format is :xhtml
set :sass, {:format => :html5 } # default Haml format is :

require 'lib/partials'
include Sinatra::Partials

require 'hpricot'
require 'tamtam'

require 'dm-core'
require 'dm-timestamps'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/mymail.db")

class MyMail
    include DataMapper::Resource
    property :id, Serial
    property :to, String
    property :salutation, String
    property :from, String
    property :title, String
    property :message, Text
    property :body, Text
    property :created_at, DateTime
    property :updated_at, DateTime
end

# automatically create the post table
MyMail.auto_upgrade!

helpers do
end

get '/favicon.ico' do
end
 
get '/styles/:style.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :"styles/#{params[:style].to_sym}"
end
 
get '/' do
  haml :new
end

post '/' do
  @mymail = MyMail.new(params[:mymail])
  @mymail.body = process_body
  
  if @mymail.save
    redirect("/#{@mymail.id}")
  else
    redirect('/')
  end
end

get '/list' do
  @mymails = MyMail.all
  if @mymails.size > 0
  haml :list
  else
    redirect('/')
  end
end

get '/:id' do
  @mymail = MyMail.get(params[:id])
  haml :show
end

get '/:id/delete' do
  @mymail = MyMail.get(params[:id])
  @mymail.destroy!
  redirect '/list'
end

def process_body
  @body = Hpricot.parse(params[:template][:tempfile].read)
  (@body/'#message').inner_html = @mymail.message
  (@body/'#salutation').inner_html = @mymail.salutation
  doc = @body.to_s
  @inlined_body = TamTam.inline(:document => doc)
end
