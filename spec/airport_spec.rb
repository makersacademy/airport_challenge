require "airport"
require "plane"

describe Airport do

  it "instructs plane to land" do
    plane = Plane.new
    expect(subject.instruct_land(plane)).to eq true
  end

  it "instructs plane to take-off" do
    plane = Plane.new
    expect(subject.instruct_takeoff(plane)).to eq true
  end

  it "won't let a plane take-off if the weather is stormy" do
    plane = Plane.new
    allow(subject.instruct_takeoff(plane)).to receive(:stormy_weather) { true }
  end

end
