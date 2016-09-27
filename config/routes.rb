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
    get 'games/:id/migrate_to_stat', to:'games#migrate', as: 'game_stat_migrate'

    # Action Section
    post '/actions', to: 'actions#create', as: 'create_action'
    get '/actions/quarter_end/:game_id', to: 'actions#quarter_end', as: 'quarter_end'
    delete '/actions/:id', to: 'actions#delete', as: 'delete_action'


    #Action Sequence
    get '/actions/:id/position/:pos_index', to: 'actions#position_move', as: 'action_move_postion'
  end

  # API
  namespace :api, path: '/', constraints:{subdomain: 'api'}  do
    get 'team', to: 'team#team'

    get 'players', to: 'players#index'
    get 'players/:id', to:'players#show'
    # get 'players?season = '
    # get 'players?season = '

    get 'seasons', to: 'seasons#index'
    get 'seasons/:id', to: 'seasons#show'

    # get 'games'
    # get 'games/:id'
    # get 'games/:id/score'
    # get 'games/:id/team_stat'
    # get 'games/:id/player_stat'
    # get 'games/:id/play_by_play'
    # get 'games/:id/basic_info'
    # get 'games/:id/detail_info'


  end

  # Design Guide
  get '/design/', to: 'design#about', as: 'design_about'
  get 'design/typography', to: 'design#typography', as: 'design_typography'
  get 'design/table', to: 'design#table', as: 'design_table'
  get 'design/table_example', to: 'design#table_example', as: 'design_table_example'
  get 'design/dropdown', to: 'design#dropdown', as: 'design_dropdown'
  get 'design/card-panel', to: 'design#card_panel', as: 'design_card_panel'

  get 'design/player_card', to: 'design#player_card', as: 'design_player_card'
  get 'design/player_header', to: 'design#player_header', as: 'design_player_header'

  get 'design/match_card', to: 'design#match_card', as: 'design_match_card'
  get 'design/match_header', to: 'design#match_header', as: 'design_match_header'
  get 'design/match_stat', to: 'design#match_stat', as: 'design_match_stat'
  get 'design/match_boxscore', to: 'design#match_boxscore', as: 'design_match_boxscore'
  get 'design/match_playbyplay', to: 'design#match_playbyplay', as: 'design_match_playbyplay'

  get 'design/team_header', to: 'design#team_header', as: 'design_team_header'

  get 'design/global_nav', to: 'design#global_nav', as: 'design_global_nav'

  # Page
  root 'team_page#show'

end
