require "plane"
# require "weather"

describe Plane do

  it "should return 'flying' if the plan_state is true" do
    plane = Plane.new("London", "Paris", "flying")
    expect(plane.flying?).to eq true
  end

  it "should return 'landed' if the plan_state is true" do
    plane = Plane.new("London", "Paris", "landed")
    expect(plane.landed?).to eq true
  end



end
