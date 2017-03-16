class PlayerStat < ActiveRecord::Base
  belongs_to :game
  belongs_to :player

  validates :game, uniqueness: { scope: :player, message: "should only have one record per game per player" }

  # ATTRIBUTES
  def points
    self.fgm * 2 + self.tpm + self.ftm
  end

  def rebound
    self.oreb + self.dreb
  end

  def field_goal_percent
    return 0 if self.fga == 0
     self.fgm * 100.to_f / self.fga
  end

  def three_point_percent
    return 0 if self.tpa == 0
    self.tpm * 100.to_f / self.tpa.to_f
  end

  def free_throw_percent
    return 0 if self.fta == 0
    self.ftm * 100.to_f / self.fta.to_f
  end

  # OPERATION
  def update_dnp(bol)
    self.update(dnp: bol)
  end

  def update_score_only(score)
    self.update(score_only_score: score, score_only: true, dnp: true)
  end

  def reset_score_only
    self.update(score_only_score: 0, score_only: false, dnp: false)
  end

  def update_from_one_action(action)
    case action.action_index
      when 0
        self.increment(:fgm).increment(:fga)
      when 1
        self.increment(:fga)
      when 2
        self.increment(:fgm).increment(:fga).increment(:tpm).increment(:tpa)
      when 3
        self.increment(:fga).increment(:tpa)
      when 4
        self.increment(:fta).increment(:ftm)
      when 5
        self.increment(:fta)
      when 6
        self.increment(:oreb).increment(:fgm).increment(:fga)
      when 7
        self.increment(:oreb).increment(:fga)
      when 8
        self.increment(:ast)
      when 9
        self.increment(:oreb)
      when 10
        self.increment(:dreb)
      when 11
        self.increment(:stl)
      when 12
        self.increment(:foul)
      when 13
        self.increment(:tov)
      when 14
        self.increment(:blk)
      else
        ap "Not Implement yet"
    end
  end



end
