require 'airport'
require 'plane'

describe Airport do
  
  it 'class Airport works' do
    expect(subject).to be_a_kind_of(Airport)
  end

  it 'plane can land in an airport' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'plane can take off from an airport' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'take_off method confirms plane is not longer in the airport' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off(plane)).to eq ("#{plane} no longer in #{subject} airport")
  end

  it 'raise an error if airport is full and try to land a plane (testing capacity of 6 planes)' do
    capacity_test = 6
    airport = Airport.new(capacity_test)
    capacity_test.times { airport.land(Plane.new) }
    expect { airport.land(Plane.new) }.to raise_error 'Airport full'
  end

  it 'take_off method removes a plane from the airport (testing capacity of 6 planes)' do
    capacity_test = 6
    airport = Airport.new(capacity_test)
    capacity_test.times { airport.land(Plane.new) }
    airport.take_off(Plane.new)
    expect { airport.land(Plane.new) }.not_to raise_error
  end

  it 'capacity of airport can be overriden' do
    subject.capacity = 20
    expect(subject.capacity).to eq(20)
  end

end
