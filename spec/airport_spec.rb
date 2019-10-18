require 'airport'

describe Airport do

  it ' should be able to respond to land' do
    airport = Airport.new
    expect(airport).to respond_to(:land)
  end

  it 'should be able to respond to take_off' do
    airport = Airport.new
    expect(airport).to respond_to(:take_off)
  end

  it 'should be able to respond to weather' do
    airport = Airport.new
    expect(airport).to respond_to(:weather)
  end

  it 'has a default capacity' do
    airport = Airport.new
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'should land a plane' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes).to include plane
  end

  it 'should let a plane take off' do
    plane = Plane.new
    subject.take_off
    expect(subject.planes).to eq plane
  end

end
