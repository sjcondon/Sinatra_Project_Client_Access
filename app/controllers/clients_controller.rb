class ClientsController < ApplicationController

  #New
  get '/clients/new' do
      if logged_in?
        erb :'/clients/new'
      else
        redirect '/login'
      end
  end

  #Create >form with a post request
  post '/clients' do
      filtered_params = params.reject{|key,value| key == "image" && value.empty?} 
      @client = current_user.clients.build(filtered_params)
      @client.image = nil if @client.image.empty? 
      if !@client.name.empty? && !@client.bio.empty?
          @client.save
          redirect '/clients'
      else 
        @error = "Data invalid. Please try again"
        erb :'/clients/new'
      end
  end

  #Read
  get '/clients' do
    if logged_in?
      @clients = Client.all.reverse
      erb :'clients/index'
    else
      redirect '/login'
    end
  end

  #Show
  get '/clients/:id' do
    if User.find_by(id: session[:user_id])
      @client = Client.find(params[:id])
      erb :'clients/show'
    else
      redirect '/login'
  end
end

  #Edit
  get '/clients/:id/edit' do
    if logged_in?
      @client = Client.find(params[:id])
      erb  :'/clients/edit'
    else
      redirect '/login'
    end
end

  #Update
  patch '/clients/:id' do 
    @client = Client.find(params[:id])
    if !params["client"]["name"].empty? && !params["client"]["bio"].empty?
        @client.update(params["client"])
        redirect to "/clients/#{params[:id]}"   
    else
        @error = "Data invalid. Please try again."
        erb :'/clients/edit'
    end
end

  #Destroy
  delete '/clients/:id' do
    client = Client.find(params[:id])
    client.destroy
    redirect '/clients'
  end
end
