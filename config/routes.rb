Rails.application.routes.draw do

  namespace :admin, path: 'admin' do
    get '/', to: 'index#show', as: 'index'

    # Season Section
    get '/seasons', to: 'seasons#show', as: 'season'
    post '/seasons', to: 'seasons#create', as:'new_season'
    patch '/seasons/:id/set_current', to: 'seasons#set_current', as:'set_current_season'
    delete '/seasons/:id/delete', to:'seasons#delete', as:'delete_season'

    # Player Section
    resources :players

    # Roster section
  end





  root 'home_page#index'

end
