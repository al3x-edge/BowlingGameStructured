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
    frame.completed?
  end
end
