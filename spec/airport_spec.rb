require 'airport'

describe Airport do
  it 'allows a plane to land' do
    expect(subject).to respond_to(:land).with(1).arguments
  end

  it 'allows a plane to take off' do
    expect(subject).to respond_to(:take_off).with(1).arguments
  end

  it 'returns error if the airport is full' do
    airport = Airport.new(10)
    10.times { airport.land(Plane.new) }
    expect {airport.land(Plane.new)}.to raise_error 'Cannot land - airport is full'
  end

  it 'has a default airport capacity' do
    expect(subject.capacity).to eq 50
  end

  it 'updates the terminal capacity when a plane takes off' do
    airport = Airport.new
    10.times { airport.land(Plane.new) } 
    airport.take_off(Plane.new)
    expect(airport.terminal.count).to eq 9
  end

  it 'checks the weather before takeoff' do
    airport = Airport.new
    plane = Plane.new
    expect {airport.take_off(plane)}.to raise_error "Cannot take off - stormy weather" if airport.stormy?
  end
end

