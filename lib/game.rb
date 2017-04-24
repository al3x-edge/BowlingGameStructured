require_relative "./frame"

class Game
  attr_accessor :frames
  attr_reader :current_frame
  attr_reader :score

  def initialize
    @frames = []
    @current_frame = 1
    @score = 0
  end

  def score
    @score
  end
end
