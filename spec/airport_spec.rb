require_relative './../lib/plane'
require_relative './../lib/airport'

describe Airport do

  it "lands a plane at an airport" do
    plane = Plane.new
    expect(subject.land(plane)).to eq "Landed"
  end

  it "plane can take off from an airport" do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq "Took off"
  end

  it "does not land plane if the airport is full" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.land(plane)).to eq "This airport is full - cannot land"
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'has a variable capacity' do
    airport = Airport.new(50)
    plane = Plane.new
    50.times { airport.land(plane) }
    expect(airport.land(plane)).to eq "This airport is full - cannot land"
  end

end
