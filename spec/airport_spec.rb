require 'airport'
require 'plane'

describe Airport do 
  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'keeps track of how many planes it has' do
   parked_planes = 0
   plane = Plane.new
   plane.land_at_airport(subject)
   expect(subject.parked_planes.count).to eq 1
  end

end 