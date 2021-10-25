require_relative './../lib/plane'
require_relative './../lib/airport'

describe Airport do

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'has a variable capacity' do
    airport = Airport.new(50)
    plane = Plane.new
    50.times { plane.land(airport) }
    expect(plane.land(airport)).to eq "This airport is full - cannot land"
  end

end
