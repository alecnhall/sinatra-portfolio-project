class PantriesController < ApplicationController
    
    get '/pantries' do 
        redirect_if_not_logged_in
        @pantries = current_user.pantries.all
        erb :'pantries/index'
    end

    get '/pantries/new' do    
        redirect_if_not_logged_in
        @error_message = params[:error]
        erb :'pantries/new'
    end

    get '/pantries/:id/edit' do   
        redirect_if_not_logged_in
        @error_message = params[:error]
        @pantry = Pantry.find(params[:id])
        erb :'pantries/edit'
    end

    post '/pantries/:id' do 
        redirect_if_not_logged_in
        @pantry = Pantry.find(params[:id])
        @pantry.update(params.select{|p| p=="name" || p=="nationality"})
        redirect '/pantries/' + @pantry.id.to_s
    end

    get "/pantries/:id" do
        redirect_if_not_logged_in
        @pantry = Pantry.find(params[:id])
        erb :'pantries/show'
    end

    post "/pantries" do
        redirect_if_not_logged_in
        Pantry.create(name: params[:name], nationality: params[:nationality], user_id: current_user.id)
        redirect '/pantries'
    end
    
end