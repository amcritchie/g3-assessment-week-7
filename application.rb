require 'sinatra/base'
require 'gschool_database_connection'
require "rack-flash"
require './lib/country_list'
require_relative "lib/message_list"

class Application < Sinatra::Application

  enable :sessions
  use Rack::Flash

  def initialize
    super
    @database_connection = GschoolDatabaseConnection::DatabaseConnection.establish(ENV['RACK_ENV'])

    @message_table = MessageTable.new(
        GschoolDatabaseConnection::DatabaseConnection.establish(ENV["RACK_ENV"])
    )
  end

  get '/' do
    messages = @message_table.messages

    erb :index, :locals => {:messages => messages}
  end


  post "/message" do

      if params[:message] == ""
        flash[:registration] = "Please enter a message before submitting."
        redirect "/"
      end
      flash[:notice] = "Thanks for the message"
      @message_table.create(params[:username],params[:message])
      redirect "/"
  end

  get '/continents' do
    all_continents = CountryList.new.continents
    erb :continents, locals: { continents: all_continents }
  end

  get '/continents/:continent_name' do
    list_of_countries = CountryList.new.countries_for_continent(params[:continent_name])
    erb :countries, locals: { countries: list_of_countries, continent: params[:continent_name] }
  end

end

