class LandmarksController < ApplicationController

  # allows you to view form to create a new landmark [x]
  # allows you to create a new landmark [x]
  # allows you to list all landmarks [x]
  # allows you to see a single landmark [x]
  # allows you to view form edit a single landmark []
  # allows you to edit a single landmark []


  get '/landmarks' do
    @landmarks = Landmark.all

    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])

    redirect "/landmarks"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])

    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])

    erb :'/landmarks/edit'
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.name = params[:landmark][:name] if !params[:landmark][:name].empty?
    @landmark.year_completed = params[:landmark][:year_completed] if !params[:landmark][:year_completed].empty?
    @landmark.save


    redirect "/landmarks/#{@landmark.id}"
  end


end
