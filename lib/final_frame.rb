class FinalFrame < Frame
  def completed?
    (@ball_rolls.length == 2 && score < 10) || @ball_rolls.length == 3
  end
end
