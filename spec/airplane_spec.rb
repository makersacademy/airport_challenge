require 'airplane.rb'
require 'airport.rb'

describe "Airplane" do
  it "landed" do
    plane = Airplane.new
    expect(plane.landed).to be true
  end

  it "can land in airport" do
    plane = Airplane.new
    plane.land
    expect(plane.landed).to eq true
  end

  it "can take off from airport" do
    plane = Airplane.new
    plane.take_off
    expect(plane.landed).to eq false
  end

  it "confirm plane has taken off" do
    plane = Airplane.new
    plane.take_off
    expect(plane.landed).to eq false
  end
end
