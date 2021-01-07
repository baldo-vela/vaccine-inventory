class ImmunizationSitesController < ApplicationController

  # GET: /immunization_sites
  get "/immunization_sites" do
    erb :"/immunization_sites/index.html"
  end

  # GET: /immunization_sites/new
  get "/immunization_sites/new" do
    erb :"/immunization_sites/new.html"
  end

  # POST: /immunization_sites
  post "/immunization_sites" do
    redirect "/immunization_sites"
  end

  # GET: /immunization_sites/5
  get "/immunization_sites/:id" do
    erb :"/immunization_sites/show.html"
  end

  # GET: /immunization_sites/5/edit
  get "/immunization_sites/:id/edit" do
    erb :"/immunization_sites/edit.html"
  end

  # PATCH: /immunization_sites/5
  patch "/immunization_sites/:id" do
    redirect "/immunization_sites/:id"
  end

  # DELETE: /immunization_sites/5/delete
  delete "/immunization_sites/:id/delete" do
    redirect "/immunization_sites"
  end
end
