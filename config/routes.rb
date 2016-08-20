Rails.application.routes.draw do

  namespace :admin, path: 'admin' do
    get '/', to: 'index#show', as: 'index'

    # Season Section
    get '/seasons', to: 'seasons#index', as: 'seasons'
    post '/seasons', to: 'seasons#create', as:'new_season'
    get 'seasons/:id', to: 'seasons#show', as: 'season'
    patch 'seasons/:id/update', to:'seasons#update', as: 'update_season'
    patch '/seasons/:id/set_current', to: 'seasons#set_current', as:'set_current_season'
    delete '/seasons/:id/delete', to:'seasons#delete', as:'delete_season'


    # Player Section
    resources :players

    # Roster section
    get '/rosters', to: 'rosters#show', as: 'rosters'
    get '/rosters/:id/manage', to: 'rosters#manage', as: 'manage_roster'
    post 'rosters/add/:season_id/:player_id', to: 'rosters#add', as:'add_roster'
    delete 'rosters/delete/:season_id/:player_id', to: 'rosters#delete', as:'delete_roster'

    # Game/Schedule Section
    post '/games/create', to: 'games#create', as: 'create_game'
    delete '/games/:id/delete', to:'games#delete', as:'delete_game'
    get 'games/:id', to:'games#show', as: 'game'
    post 'games/:id/init', to:'games#init', as: 'game_init'

  end





  root 'home_page#index'

end
