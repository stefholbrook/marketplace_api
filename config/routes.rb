require "api_constraints"

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # maps to controllers/api directory for api.marketplace_api.test subdomain and the starting path to be root
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do
    # maps to controllers/api/v1 directory
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources(:users, :only => [:show])
    end
  end
end
