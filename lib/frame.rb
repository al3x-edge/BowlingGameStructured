class Frame
  attr_accessor :frame_score

  def initialize
    @ball_rolls = []
  end

  def roll(pins)
    @ball_rolls << pins
  end

  def score
    @ball_rolls.reduce(0) { |sum, roll| sum += roll }
  end

  def completed?
    @ball_rolls.length == 2
  end
end
