Rails.application.routes.draw do

  resources :reports, only: [:new,:create,:index] ,:path => '/'

  
end
