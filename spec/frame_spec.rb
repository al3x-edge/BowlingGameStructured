require_relative "./spec_helper"

describe Frame do
  let(:frame) { Frame.new }

  it "starts with a score of 0" do
    expect(frame.score).to eq 0
  end

  it "can keep ball roll scores" do
    frame.roll(5)
    expect(frame.score).to eq 5
  end

  it "has a completed mark if two balls have been rolled under 10" do
    frame.roll(5)
    frame.roll(5)
    expect(frame.completed?).to be_truthy
  end

  it "has a completed mark if a ball has been rolled as a single 10" do
    frame.roll(10)
    expect(frame.completed?).to be_truthy
  end

  it "returns the score bonus for a previous strike" do
    frame.roll(5)
    frame.roll(3)
    expect(frame.bonus_score_for_strike).to eq 8
  end

  it "returns the score bonus for a previous spare" do
    frame.roll(5)
    frame.roll(3)
    expect(frame.bonus_score_for_spare).to eq 5
  end

  it "is marked as a strike if the score is 10 in a single roll" do
    frame.roll(10)
    expect(frame.strike?).to be_truthy
    expect(frame.spare?).to be_falsey
  end

  it "is marked as a space if the score is 10 but with two rolls" do
    frame.roll(5)
    frame.roll(5)
    expect(frame.spare?).to be_truthy
    expect(frame.strike?).to be_falsey
  end
end
