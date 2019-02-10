require './lib/plane'

describe Plane do

# Arrange
  it "must create a plane" do
    plane = Plane.new
  end

  it "the plane must be able to receive the message to land" do
    plane = Plane.new
    expect(plane.land).to eq "Message to land received"
  end

  it "the plane must be able to receive the message to takeoff" do
    plane = Plane.new
    expect(plane.takeoff).to eq true
  end

  it "the plane must confirm it is in the air after takeoff" do
    plane = Plane.new
    expect(plane.takeoff).to eq true
  end

  it "must not take off if weather status is stormy " do
    plane = Plane.new
    stormy = true
    weather = Weather.new(stormy)
    expect(plane.takeoff(stormy)).to eq false 
  end

end

