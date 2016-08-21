class TeamStat < ActiveRecord::Base
  belongs_to :game

  validates :game_id, presence:true, uniqueness:{message: "team stat should be unique" }

  def update_from_one_action(params)
    case params[:action_index]
      when "0"
        self.increment(:fgm).increment(:fga).save
      when "1"
        self.increment(:fga).save
      when "2"
        self.increment(:fgm).increment(:fga).increment(:tpm).increment(:tpa).save
      when "3"
        self.increment(:fga).increment(:tpa).save
      when "4"
        self.increment(:fta).increment(:ftm).save
      when "5"
        self.increment(:fta).save
      when "6"
        self.increment(:oreb).increment(:fgm).increment(:fga).save
      when "7"
        self.increment(:oreb).increment(:fga).save
      when "8"
        self.increment(:ast).save
      when "9"
        self.increment(:oreb).save
      when "10"
        self.increment(:dreb).save
      when "11"
        self.increment(:stl).save
      when "12"
        self.increment(:foul).save
      when "13"
        self.increment(:tov).save
      when "14"
        self.increment(:blk).save
      when "15"
        ap 'quarter_end'
      else
        ap "Not Implement yet"
    end
  end

end
