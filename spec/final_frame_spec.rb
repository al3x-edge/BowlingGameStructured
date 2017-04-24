require_relative "./spec_helper"

describe FinalFrame do
  let(:final_frame) { FinalFrame.new }

  it "is completed if two balls lower than 10 are rolled" do
    final_frame.roll(4)
    final_frame.roll(4)

    expect(final_frame.completed?).to be_truthy
  end

  it "is not completed if only two strikes are thrown" do
    final_frame.roll(10)
    final_frame.roll(10)

    expect(final_frame.completed?).to_not be_truthy
  end

  it "is completed if three strikes are thrown" do
    final_frame.roll(10)
    final_frame.roll(10)
    final_frame.roll(10)

    expect(final_frame.completed?).to be_truthy
  end

  it "is completed if a spare and another strike are thrown" do
    final_frame.roll(5)
    final_frame.roll(7)
    final_frame.roll(10)

    expect(final_frame.completed?).to be_truthy
  end

  it "is completed if a spare and another open frame are thrown" do
    final_frame.roll(5)
    final_frame.roll(7)
    final_frame.roll(1)

    expect(final_frame.completed?).to be_truthy
  end
end
