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

    if current_frame.nil?
      @frames << Frame.new
    elsif current_frame.completed? && @frames.length == 9
      @frames << FinalFrame.new
    elsif current_frame.completed?
      @frames << Frame.new
    end
    current_frame.roll(pins)
  end

  def score
    return 0 if @frames.length == 0
    score = 0

    @frames.each_with_index do |frame, index|
      if frame.strike?
        score += frame.score

        next_frame = @frames[index + 1]
        second_frame = @frames[index + 2]

        score += next_frame.bonus_score_for_strike if !next_frame.nil?
        score += second_frame.ball_rolls.first if !second_frame.nil? && next_frame.strike?
      elsif frame.spare?
        score += frame.score
        next_frame = @frames[index + 1]
        score +=  next_frame.bonus_score_for_spare if !next_frame.nil?
      else
        score += frame.score
      end
    end

    score
  end

  def current_frame
    @frames.last
  end

  def finished?
    @frames.length == 10 && current_frame.completed?
  end

  def to_s
    @frames.map(&:score).join(' - ')
  end
end
