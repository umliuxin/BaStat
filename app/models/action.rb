class Action < ActiveRecord::Base
  belongs_to :game
  belongs_to :player
  acts_as_list scope: :game


  validates :game_id, presence: { message: 'game_id is null'}
  validates :player_id, presence: { message: 'player is null'}
  validates :action_index, presence: { message: 'action is null'}
  validates :description, length: { maximum: 200 }


  def move(key)
    case key
    when 'moveup'
      self.move_higher
    when 'movedown'
      self.move_lower
    else
    end

  end

  def player_name
    if self.player_id == OPPO_TEAM_ID
      OPPO_NAME
    elsif self.player_id == TEAM_ID
      TEAM_NAME
    elsif self.player_id == NULL_PLAYER_ID
      'GAME'
    else
      self.player.name
    end
  end

  def update_score_before_removing
    remove_params = {
      player_id: self.player_id,
      action_index: self.action_index,
      game_id: self.game_id,
      remove: true
    }

    self.game.score.update_score(remove_params)
  end


end
