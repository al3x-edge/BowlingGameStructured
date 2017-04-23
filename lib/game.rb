class Game
  def initialize
    @frames = [0,0,0,0,0,0,0,0,0,0]
    @current_frame = 0
  end

  def frames
    @frames
  end

  def score
    0
  end

  def current_frame
    @current_frame + 1
  end
end
