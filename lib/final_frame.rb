class FinalFrame < Frame
  def completed?
    (@ball_rolls.length == 2 && score < 10) || @ball_rolls.length == 3
  end

  def bonus_score_for_strike
    @ball_rolls[0] + @ball_rolls[1]
  end
end
