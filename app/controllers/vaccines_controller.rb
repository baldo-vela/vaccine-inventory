class VaccinesController < ApplicationController

  # GET: /vaccines
  get "/vaccines" do
    erb :"/vaccines/index.html"
  end

  # GET: /vaccines/new
  get "/vaccines/new" do
    erb :"/vaccines/new.html"
  end

  # POST: /vaccines
  post "/vaccines" do
    redirect "/vaccines"
  end

  # GET: /vaccines/5
  get "/vaccines/:id" do
    erb :"/vaccines/show.html"
  end

  # GET: /vaccines/5/edit
  get "/vaccines/:id/edit" do
    erb :"/vaccines/edit.html"
  end

  # PATCH: /vaccines/5
  patch "/vaccines/:id" do
    redirect "/vaccines/:id"
  end

  # DELETE: /vaccines/5/delete
  delete "/vaccines/:id/delete" do
    redirect "/vaccines"
  end
end
