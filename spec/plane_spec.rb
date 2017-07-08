require 'plane'

describe Plane do

  let(:plane) { Plane.new }
  let(:bigplane) { Plane.new(100) }
  let(:passenger) { double(:passenger) }

  it "responds to .full?" do
    expect(subject).to respond_to(:full?)
  end
  it "responds correct to .full?" do
    expect(plane.full?).to eq false
    50.times { plane.board(passenger) }
    expect(plane.full?).to eq true
  end
  it "responds to .landed? with true/false" do
    expect(subject).to respond_to(:landed?)
    plane.takeoff
    expect(plane.landed?).to be false
    plane.land
    expect(plane.landed?).to be true
  end
  it "responds to alight correctly" do
    plane.board(passenger)
    expect(plane.alight).to be passenger
  end
  it "can take an argument at creation to set capacity" do
    expect(bigplane.capacity).to eq 100
  end
end
