require 'airport'
require 'plane'

describe Airport do
  it 'responds to the method full?' do
    expect(subject).to respond_to(:full?)
  end

  it 'responds to the takeoff method' do
    expect(subject).to respond_to(:takeoff)
  end

  it 'responds to the land method' do
    expect(subject).to respond_to(:land)
  end
end

describe "#takeoff" do
  it 'instruct a plane to take off from the airport' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.takeoff(plane)).to eq(plane)
  end
end

describe "#land" do
  it 'lands a plane at the airport' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.airport.length).to eq 1
  end
end

describe "#full" do
  it 'tells us if the airport has any planes in it' do
    newairport = Airport.new
    expect(newairport.full?).to eq 0 
  end
end
