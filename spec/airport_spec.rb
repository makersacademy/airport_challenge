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
    allow(subject).to receive(:weather) { "sunny" }
    subject.land(plane)
    expect(subject.take_off(plane)).to eq ("#{plane} no longer in #{subject} airport")
  end

  it 'raise an error if airport is full and try to land a plane (testing capacity of 6 planes)' do
    capacity_test = 6
    airport = Airport.new(capacity_test)
    allow(airport).to receive(:weather) { "sunny" }
    capacity_test.times { airport.land(Plane.new) }
    expect { airport.land(Plane.new) }.to raise_error 'Airport full'
  end

  it 'take_off method removes a plane from the airport (testing capacity of 6 planes)' do
    capacity_test = 6
    plane = Plane.new
    airport = Airport.new(capacity_test)
    allow(airport).to receive(:weather) { "sunny" }
    airport.land(plane)
    (capacity_test - 1).times { airport.land(Plane.new) }
    airport.take_off(plane)
    expect { airport.land(Plane.new) }.not_to raise_error
  end

  it 'capacity of airport can be overriden' do
    subject.capacity = 20
    expect(subject.capacity).to eq(20)
  end

  it 'weather returns sunny or stormy' do
    expect(subject.weather).to eq("sunny").or eq("stormy")
  end

  it 'plane cannot land when stormy weather' do
    allow(subject).to receive(:weather) { "stormy" }
    expect { subject.land(Plane.new) }.to raise_error 'Plane cannot land on stormy weather'
  end

  it 'plane cannot take off when stormy weather' do
    allow(subject).to receive(:weather) { "sunny" }
    plane = Plane.new
    subject.land(plane)
    allow(subject).to receive(:weather) { "stormy" }
    expect { subject.take_off(plane) }.to raise_error 'Plane cannot take off on stormy weather'
  end

  it 'take_off method to take out specific plane from airport' do
    plane = Plane.new
    airport = Airport.new(3)
    allow(airport).to receive(:weather) { "sunny" }
    airport.land(plane)
    airport.land(Plane.new)
    airport.take_off(plane)
    expect(airport.planes).not_to include(plane)
  end

  it 'take_off raise error if plane is not in the airport' do
    allow(subject).to receive(:weather) { "sunny" }
    subject.land(Plane.new)
    expect { subject.take_off(Plane.new) }.to raise_error ('Plane not in this airport')
  end
    
end
