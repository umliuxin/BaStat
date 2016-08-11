Rails.application.routes.draw do

  resources :players

  namespace :admin, path: '' do
    get '/admin', to: 'index#show', as: 'index'
  end


  # Season Section
  post '/season', to: 'season#create', as:'new_season'


  root 'home_page#index'

end
