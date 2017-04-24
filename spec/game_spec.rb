require_relative './spec_helper'

describe Game do
  let(:game) { Game.new }

  context "a new game" do
    it "has 0 frames" do
      expect(game.frames.length).to eq 0
    end

    it "has a score of 0" do
      expect(game.score).to eq 0
    end

    it "starts on frame 1" do
      expect(game.current_frame).to eq 1
    end
  end

end
