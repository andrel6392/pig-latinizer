require 'dotenv/load'
require 'bundler'
Bundler.require

require_relative 'models/pig_latinize.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/result' do
    user_song = params[:song]
    user_artist = params[:artist]
    user_lyrics = params[:lyrics]
    @pl = PigLatinizer.new(user_song,user_artist,user_lyrics)
    
    erb :result
  end

end