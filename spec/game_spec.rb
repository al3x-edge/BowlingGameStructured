require_relative './spec_helper'

describe Game do
  let(:game) { Game.new }

  def roll_many(game, num, pins)
    num.times do |hit|
      game.roll(pins)
    end
  end

  it "starts the game with a score of 0" do
    expect(game.score).to eq 0
  end

  it "can roll a gutter ball for a score of 0" do
    game.roll(0)
    expect(game.score).to eq 0
  end

  it "can roll a ball with one pin knocked down; scores 1" do
    game.roll(1)
    expect(game.score).to eq 1
  end

  it "should have a total score of 20 for a pin in each frame on each ball" do
    roll_many(game, 20, 1)
    expect(game.score).to eq 20
  end

  it "is considered finished if in the tenth frame" do
    roll_many(game, 20, 1)
    expect(game.finished?).to be_truthy
  end

  it "returns an error if rolling when the game is finished" do
    roll_many(game, 20, 1)
    expect { game.roll(1) }.to raise_error(Game::GameFinishedError)
  end
end
