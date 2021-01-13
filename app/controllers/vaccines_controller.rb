class VaccineController < ApplicationController
  get '/vaccines' do
    redirect_if_not_logged_in
    if params[:query] # only exist if search is filled out
      # search for vaccines based on query
      @vaccines = current_user.vaccines.search(params[:query])
    elsif params[:filter]
      # @vaccines = list of vaccines that are filtered by genre
      @vaccines = current_user.vaccines.by_genre(params[:filter]).alphabetize
    else # search is not filled out so show all vaccines
      @vaccines = current_user.vaccines.alphabetize
    end
    @vaccine = vaccine.find_by_id(session[:vaccine_id])
    erb :'vaccines/index'
  end

  get '/vaccines/new' do
    redirect_if_not_logged_in
    erb :'vaccines/new'
  end
  
  get '/vaccines/:id' do
    redirect_if_not_logged_in
    find_vaccine
    redirect_if_not_owner
    session[:vaccine_id] = @vaccine.id if @vaccine
    redirect_if_vaccine_not_found
    erb :'vaccines/show'
  end
  
  get '/vaccines/:id/edit' do
    redirect_if_not_logged_in
    find_vaccine
    redirect_if_vaccine_not_found
    redirect_if_not_owner
    erb :'vaccines/edit'
  end
  
  post '/vaccines' do
    vaccine = vaccine.new(params[:vaccine])
    if vaccine.save
      current_user.vaccines << vaccine
      redirect '/vaccines'
    else
      flash[:errors] = vaccine.errors.full_messages
      redirect '/vaccines/new'
    end
  end

  post '/vaccines/add' do
    @vaccine = vaccine.find_by_id(params[:vaccine][:id])
    if @vaccine && !current_user.vaccines.include?(@vaccine)
      current_user.vaccines << @vaccine
      redirect "/vaccines"
    else
      redirect "/vaccines/new"
    end
  end
  
  patch "/vaccines/:id" do
    find_vaccine
    redirect_if_vaccine_not_found
    if @vaccine.update(params[:vaccine])
      redirect "/vaccines/#{@vaccine.id}"
    else
      redirect "/vaccines/#{@vaccine.id}/edit"
    end
  end
  
  delete '/vaccines/:id' do
    find_vaccine
    redirect_if_vaccine_not_found
    redirect_if_not_owner
    @vaccine.destroy
    redirect "/vaccines"
  end
  
  private
  def find_vaccine
    @vaccine = vaccine.find_by_id(params[:id])
  end
  
  def redirect_if_vaccine_not_found
    redirect "/vaccines" unless @vaccine
  end

  def redirect_if_not_owner
    redirect "/vaccines" unless @vaccine.user == current_user
  end
end