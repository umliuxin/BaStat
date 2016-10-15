module GamesHelper
  def team_stat_class(num1, num2)
    if num1>num2
      'advantage'
    elsif num1<num2
      'disadvantage'
    else
      'even'
    end

  end
end
