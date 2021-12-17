require "airport"

describe Airport do
  it "responds to land" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "stores a plane when it lands" do
    plane = double(:plane)
    expect(subject.land(plane)).to match_array [plane]
  end

  it "responds to take_off" do
    expect(subject).to respond_to(:take_off)
  end
end