ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

namespace :db do

    des 'Seed the database with dummy data'
    task :seed do
        require_relative './db/seeds.rb'
    end




end