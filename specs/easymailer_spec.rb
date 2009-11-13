require File.dirname(__FILE__) + '/spec_helper'

describe "EasyMailer" do
  include Rack::Test::Methods

  # def app
  #   @app ||= Sinatra::Application
  # end
  # 
  # it "should respond to /" do
  #   get '/'
  #   last_response.should be_ok
  # end
  # 
  # it "should return the correct content-type when viewing root" do
  #   get '/'
  #   last_response.headers["Content-Type"].should == "text/html"
  # end
  # 
  # it "should use the home layout for the homepage" do
  #   get '/'
  #   last_response.body.should match /body id='home'/
  # end
  # 
  # it "should return generate a capitalised underscore stripped page_title from the path" do
  #   get '/recent_work'
  #   last_response.body.should match /Recent work/
  # end
  # 
  # it "should return a 404 when page cannot be found" do
  #   get '/hdsjdhajlkhd'
  #   last_response.headers["Content-Type"].should == "text/html"
  #   last_response.body.should match /Page not found/
  # end
  # 
  # it "should return a 404 page when /section/page cannot be found" do
  #   get "/section/page"
  #   last_response.headers["Content-Type"].should == "text/html"
  #   last_response.body.should match /Page not found/
  # end
    
  # it "should return blah blah blah when viewing root" do
  #   get '/'
  #   last_response.body == "blah blah blah"
  # end
end