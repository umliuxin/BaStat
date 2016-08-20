class TeamStat < ActiveRecord::Base
  belongs_to :game

  validates :game_id, presence:true, uniqueness:{message: "team stat should be unique" }


  def quarter_end
    
  end

end
