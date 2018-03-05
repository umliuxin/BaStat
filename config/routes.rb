Rails.application.routes.draw do

  devise_for :models
  # Admin Route
  namespace :admin, path: '/admin' do
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
    get 'games/:id/migrate_to_stat', to:'games#migrate', as: 'game_stat_migrate'
    post 'games/:id/update_score', to: 'games#update_score', as: 'game_update_score'
    post 'games/:id/update_oppo', to: 'games#update_oppo', as: 'game_update_oppo'

    get 'games/:id/dnp', to: 'games#dnp', as: 'game_dnp'
    get 'adddnp/:game_id/:player_id', to: 'games#dnp_add', as: 'game_add_dnp'
    get 'removednp/:game_id/:player_id', to: 'games#dnp_remove', as: 'game_remove_dnp'

    get 'games/:id/score_only', to: 'games#score_only', as: 'game_score_only'
    post 'games/:id/score_only_update', to: 'games#score_only_update', as: 'game_score_only_update'

    # Action Section
    post '/actions', to: 'actions#create', as: 'create_action'
    get '/actions/quarter_end/:game_id', to: 'actions#quarter_end', as: 'quarter_end'
    delete '/actions/:id', to: 'actions#delete', as: 'delete_action'


    #Action Sequence
    get '/actions/:id/position/:pos_index', to: 'actions#move', as: 'action_move_postion'
  end

  # Design Guide Route
  namespace :design, path: '/design' do
    get '/', to: 'design#about', as: 'about'
    get 'typography', to: 'design#typography', as: 'typography'
    get 'table', to: 'design#table', as: 'table'
    get 'table_example', to: 'design#table_example', as: 'table_example'
    get 'dropdown', to: 'design#dropdown', as: 'dropdown'
    get 'card-panel', to: 'design#card_panel', as: 'card_panel'

    get 'player_card', to: 'design#player_card', as: 'player_card'
    get 'player_header', to: 'design#player_header', as: 'player_header'

    get 'match_card', to: 'design#match_card', as: 'match_card'
    get 'match_header', to: 'design#match_header', as: 'match_header'
    get 'match_stat', to: 'design#match_stat', as: 'match_stat'
    get 'match_boxscore', to: 'design#match_boxscore', as: 'match_boxscore'
    get 'match_playbyplay', to: 'design#match_playbyplay', as: 'match_playbyplay'

    get 'team_header', to: 'design#team_header', as: 'team_header'

    get 'global_nav', to: 'design#global_nav', as: 'global_nav'

  end

  # API Routes
  namespace :api, path: '/api' do
    get 'team', to: 'team#team'

    resources :players, only: [:index, :show]

    resources :seasons, only: [:index, :show]

    resources :games, only: [:index, :show]

    # Video API Routes
    get 'videos', to: 'videos#query'
    post '/videos/post', to: 'videos#post'

  end

  # Video REST API manage
  get '/videos/import', to: 'videos#import', as: 'video_import'
  resources :videos, only: [:index, :show, :create, :update, :destroy]



  # Production Routes
  resources :players, only: [:index, :show]

  resources :games, only: [:show]
  get '/schedules', to: 'gamelist#schedules'
  get '/results', to: 'gamelist#results'


  # Homepage Routes
  root 'team_page#show', as: 'home'

end
