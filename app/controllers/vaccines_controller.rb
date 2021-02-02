class VaccinesController < ApplicationController
  get '/vaccines' do
    # redirect_if_not_logged_in
    if params[:query] # only exist if search is filled out
      # search for vaccines based on query
      @vaccines = Vaccine.search(params[:query])
 
    else # search is not filled out so show all vaccines
       @vaccines = Vaccine.all
    end
    @vaccine = Vaccine.find_by_id(session[:vaccine_id])
    erb :"/vaccines/index"
  end

  get '/vaccines/new' do
    binding.pry
    redirect_if_not_logged_in
    erb :'/vaccines/new'
  end
  
  get '/vaccines/:id' do
    redirect_if_not_logged_in
    find_vaccine
    redirect_if_vaccine_not_found
    erb :'/vaccines/show'
  end
  
  get '/vaccines/:id/edit' do
    redirect_if_not_logged_in
    find_vaccine
    redirect_if_vaccine_not_found
    erb :'/vaccines/edit'
  end
  
  post '/vaccines' do
    vaccine = vaccine.new(params[:vaccine])
    if vaccine.save
      redirect '/vaccines'
    else
      flash[:errors] = vaccine.errors.full_messages
      redirect '/vaccines/new'
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

end