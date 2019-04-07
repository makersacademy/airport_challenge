require 'airport'
require 'weather'
require 'plane'

describe Airport do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it "Has reached maximum capacity" do
    Airport::DEFAULT_CAPACITY.times { airport.land(plane) } 
    expect(airport.land(plane)).to eq 'Airport full'
  end

  it 'Records that a plane has taken off' do
    expect(airport.delete(plane)).to eq "Plane is no longer in airport"
  end

  it "Lets a plane land when it is sunny" do
   allow(subject).to receive(:weather) { "Sunny" }
   allow(subject).to receive(:full?) { false }
   expect(subject.control_landing(plane)).to eq "Plane landed"
  end

  it "Cannot land a plane when it is stormy" do
   allow(subject).to receive(:weather) { "Stormy" }
   expect(subject.control_landing(plane)).to eq "It is too stormy to land"
  end

  it "Lets a plane take off when it is sunny" do
   allow(subject).to receive(:empty?) { false }
   expect(subject.control_takeoff(plane)).to eq "Plane is no longer in airport"
  end

  it "Cannot let a plane take off when stormy" do
   airport.land(plane)
   allow(subject).to receive(:weather) { "Stormy" }
   expect(subject.control_takeoff(plane)).to eq "It is too stormy to take off"
  end

  it "Cannot land a plane in a full airport" do
   allow(subject).to receive(:full?) { true }
   expect(subject.control_landing(plane)).to eq "Airport full"
  end

  it "Cannot let a plane take off if the airport is empty and no planes to take off" do
   allow(subject).to receive(:empty?) { true }
   expect(subject.control_takeoff(plane)).to eq "The airport is empty"
  end
end
