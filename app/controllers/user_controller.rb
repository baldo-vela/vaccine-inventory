class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    erb :'/users/index.html'
  end

  # GET: /users/new
  get "/signup" do
    erb :'/users/new'
  end

  # POST: /users
  post "/users" do
    redirect "/users"
  end

  # GET: /users/5
  get "/users/:id" do
    erb :'/users/show'
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :'/users/edit'
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end

  private
    def find_user
      @user = User.find_by_id(params[:id])
    end

end
