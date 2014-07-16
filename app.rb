require "sinatra"
require "active_record"
require "gschool_database_connection"

class App < Sinatra::Application
  enable :sesions

  def initialize
    super

    @database_connection = GschoolDatabaseConnection::DatabaseConnection.establish(ENV["RACK_ENV"])
  end

  get "/" do
    erb :homepage
  end

  post "/" do
    id_hash = (@database_connection.sql("SELECT id FROM users WHERE email = '#{params[:email]}' AND password = '#{params[:password]}'"))
    session[:id] = id_hash
    if id_hash
      redirect "/"
    else
      @database_connection.sql("INSERT INTO users (email, password) VALUES ('#{params[:username]}', '#{params[:password]}')")
    end
  end

  get "/registration/new" do
  erb :"/registration/new"
  end
  end
