class Action < ActiveRecord::Base
  belongs_to :game
  belongs_to :player
  acts_as_list scope: :game


  validates :game_id, presence: { message: 'game_id is null'}
  validates :player_id, presence: { message: 'player is null'}
  validates :action_index, presence: { message: 'action is null'}

  def player_name
    if self.player_id == OPPO_PLAYER_ID
      OPPO_NAME
    else
      self.player.name
    end
  end

end
