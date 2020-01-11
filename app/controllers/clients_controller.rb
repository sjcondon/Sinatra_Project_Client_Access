class ClientsController < ApplicationController

  #New
  get '/clients/new' do
      erb :'/clients/new'
  end

  #Create >form with a post request
  post '/clients' do
      client = Client.new(params)
      if !client.name.empty? && !client.bio.empty?
          client.save
          redirect '/clients'
      else 
        @error = "Data invalid. Please try again"
        erb :'clients/new'
      end
  end

  #Read
  get '/clients' do
    @clients = Client.all.reverse
    erb :'clients/index'
  end

  #Show
  get '/clients/:id' do
     @client = Client.find(params["id"])
    erb :'clients/show'
  end

  #Edit
  get '/clients/:id/edit' do
    @client = Client.find(params["id"])
    erb  :'/clients/edit'
  end
end
