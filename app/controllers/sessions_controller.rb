class SessionsController < ApplicationController

    get '/login' do
        erb :'users/login'
    end

    post'/login' do
        if params["username"].empty? || params["password"].empty?
            @error = "Username and password cannot be blank"
            erb :'users/login'
        
        elsif user = User.find_by(username: params["username"], password: params["password"])
            session[:user_id] = user.id
            redirect '/clients'
        
        else 
            @error = "Account not found"
            erb :'users/login'

        end
    end
end

   
