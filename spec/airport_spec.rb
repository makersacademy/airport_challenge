require 'airport'
require 'plane'
require 'weather'

describe Airport do 
  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'keeps track of planes that have landed in the airport' do
   parked_planes = 0
   plane = Plane.new
   allow(subject).to receive(:local_weather) { "Sunny" }
   plane.land_at_airport(subject)
   expect(subject.parked_planes.count).to eq 1
  end

  it 'removes planes once they take off from the airport' do
    plane = Plane.new
    allow(subject).to receive(:local_weather) { "Sunny" }
    plane.land_at_airport(subject)
    plane.take_off_from_airport(subject)
    expect(subject.parked_planes).not_to include(plane)
  end 

end 