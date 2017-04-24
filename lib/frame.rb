class Frame
  attr_accessor :frame_score

  def initialize
    @ball_rolls = []
  end

  def roll(pins)
    @ball_rolls << pins
  end

  def score
    @ball_rolls.reduce(:+) || 0
  end

  def completed?
    @ball_rolls.first == 10 || @ball_rolls.length == 2
  end

  def bonus_score_for_strike
    score
  end

  def bonus_score_for_spare
    @ball_rolls.first
  end

  def strike?
    score == 10 && @ball_rolls.first == 10
  end

  def spare?
    score == 10 && @ball_rolls.first != 10
  end
end
