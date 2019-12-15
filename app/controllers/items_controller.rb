class ItemsController < ApplicationController

    get '/items' do
        redirect_if_not_logged_in
        @items = Item.all   
        erb :'items/index'
    end

    get '/items/new' do
        redirect_if_not_logged_in
        @error_message = params[:error]
        erb :'items/new'
    end

    get '/items/:id/edit' do   
        redirect_if_not_logged_in
        @error_message = params[:error]
        @item = Item.find(params[:id])
        erb :'items/edit'
    end

    post '/items/:id' do   
        redirect_if_not_logged_in
        @item = Item.find(params[:id])
        @item.update(params.select{|i| i=="name" || i=="amount" || i=="pantry_id"})
        redirect '/items/' + @item.id.to_s
    end

    get '/items/:id' do   
        redirect_if_not_logged_in
        @item = Item.find(params[:id])
        erb :'items/show'
    end

    post '/items' do   
        Item.create(name: params[:name], amount: params[:amount], pantry_id: params[:pantry_id])
        redirect '/items'
    end
    
end