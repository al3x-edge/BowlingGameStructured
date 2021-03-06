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

  it "should have a total score of 24 with a strike and then a 4 and 3" do
    game.roll(10)
    game.roll(4)
    game.roll(3)

    expect(game.score).to eq 24
  end

  it "should have a total score of 21 with a spare and then a 4 and 3" do
    game.roll(5)
    game.roll(5)
    game.roll(4)
    game.roll(3)

    expect(game.score).to eq 21
  end

  it "should have a total score of 240 for 9 strikes" do
    roll_many(game, 9, 10)
    expect(game.score).to eq 240
  end

  it "should have a total score of 160 for 4 strikes followed by 4 spares" do
    roll_many(game, 4, 10)
    roll_many(game, 8, 5)
    expect(game.score).to eq 160
  end

  it "should have a total score of 300 for a perfect game (12 strikes)" do
    roll_many(game, 12, 10)
    expect(game.score).to eq 300
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
