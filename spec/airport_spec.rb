require 'airport'

describe Airport do
  it "can land " do
    expect(subject).to respond_to :land
  end

  it "make a plane land" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "has the ability to store a plane" do
    expect([]).to be_empty
  end

  it "can store a specific landing plane" do
    plane=Plane.new
    airport=Airport.new
    airport.land(plane)
    expect(:landed_planes).not_to be_empty
  end


end
