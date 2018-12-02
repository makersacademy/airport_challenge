require "plane"

describe Plane do

  it "should return true if the plan_state is 'flying'" do
    plane = Plane.new("flying")
    expect(plane.flying?).to eq true
  end

  it "should return false if the plan_state is not 'flying'" do
    plane = Plane.new("nothing")
    expect(plane.flying?).to eq false
  end

  it "should return true if the plan_state 'landed'" do
    plane = Plane.new("landed")
    expect(plane.landed?).to eq true
  end

  it "should return false if the plan_state is not 'landed'" do
    plane = Plane.new("flying")
    expect(plane.landed?).to eq false
  end

end
