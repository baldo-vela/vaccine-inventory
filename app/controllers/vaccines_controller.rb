class VaccinesController < ApplicationController
  get '/vaccines' do
    redirect_if_not_logged_in
    if params[:query]
      # Work in progress
      # @vaccines = Vaccine.search(:query)

      @vaccines = Vaccine.all.sort
    elsif params[:filter]
      @vaccines = Vaccine.by_mfr(params[:filter])
    else
      @vaccines = Vaccine.all.sort
    end
    erb :"/vaccines/index"
  end

  get '/vaccines/new' do
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
    redirect_if_not_owner
    erb :'/vaccines/edit'
  end
  
  post '/vaccines' do
    redirect_if_logged_in
    vaccine = Vaccine.new(params[:vaccine])
    if vaccine.save
      redirect '/vaccines'
    else
      flash[:errors] = vaccine.errors.full_messages
      redirect '/vaccines/new'
    end
  end
  
  patch "/vaccines/:id" do
    redirect_if_not_logged_in
    find_vaccine
    redirect_if_vaccine_not_found
    redirect_if_not_owner
    if @vaccine.update(params[:vaccine])
      redirect "/vaccines/#{@vaccine.id}"
    else
      redirect "/vaccines/#{@vaccine.id}/edit"
    end
  end
  
  delete '/vaccines/:id' do
    redirect_if_not_logged_in
    find_vaccine
    redirect_if_vaccine_not_found
    redirect_if_not_owner
    @vaccine.destroy
    redirect "/vaccines"
    flash[:error] == "You do not have permission to modify this Vaccine"
  end
  
  private
  def find_vaccine
    @vaccine = Vaccine.find_by_id(params[:id])
  end
  
  def redirect_if_vaccine_not_found
    redirect "/vaccines" unless @vaccine
    flash[:error] == "Invalid Vaccine ID"
  end

  def redirect_if_not_owner
    redirect "/vaccines" unless @vaccine.user == current_user
  end

end