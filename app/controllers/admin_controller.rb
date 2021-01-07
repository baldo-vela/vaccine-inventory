class AdminController < ApplicationController

  # GET: /admin
  get "/admin" do
    erb :"/admin/index.html"
  end

  # GET: /admin/new
  get "/admin/new" do
    erb :"/admin/new.html"
  end

  # POST: /admin
  post "/admin" do
    redirect "/admin"
  end

  # GET: /admin/5
  get "/admin/:id" do
    erb :"/admin/show.html"
  end

  # GET: /admin/5/edit
  get "/admin/:id/edit" do
    erb :"/admin/edit.html"
  end

  # PATCH: /admin/5
  patch "/admin/:id" do
    redirect "/admin/:id"
  end

  # DELETE: /admin/5/delete
  delete "/admin/:id/delete" do
    redirect "/admin"
  end
end
