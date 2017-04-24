require_relative "./frame"

class Game
  attr_accessor :frames
  attr_reader :current_frame

  class GameFinishedError < RuntimeError; end

  def initialize
    @frames = []
    @current_frame = 1
  end

  def roll(pins)
    raise GameFinishedError if finished?
    @frames << Frame.new if current_frame.nil? || current_frame.completed?
    current_frame.roll(pins)
  end

  def score
    return 0 if @frames.length == 0
    @frames.map(&:score).reduce(:+)
  end

  def current_frame
    @frames.last
  end

  def finished?
    @frames.length == 10 && current_frame.completed?
  end
end
