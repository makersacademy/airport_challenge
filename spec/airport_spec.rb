require 'airport.rb'

describe 'Airport' do
  let(:airport) {Airport.new}

  it 'can create an instance of airportt' do
    expect(airport).to be_an_instance_of(Airport)
  end

  it 'can land planes in to storage when the weather is sunny' do
    plane = Plane.new
    airport.weather(3)
    airport.land_plane(plane)
    expect(airport.storage[0]).to be_an_instance_of(Plane)
  end

  it 'does not allow plane to land if the weather is stormy' do
    plane = Plane.new
    airport.weather(5)
    expect { airport.land_plane(plane) }.to raise_error
  end

  it 'can prevent landing if airport is full' do
    airport.weather(3)
    Airport::DEFAULT_CAPACITY.times { airport.land_plane(Plane.new) }
    expect { airport.land_plane(plane) }.to raise_error
  end

  it 'can prevent landing if airport is full at default capacity' do
    airport = Airport.new
    airport.weather(3)
    airport.capacity.times { airport.land_plane(Plane.new) }
    expect { airport.land_plane(plane) }.to raise_error
  end

  it 'can change default capacity and prevent landing if airport is full' do
    airport = Airport.new(20)
    airport.weather(3)
    airport.capacity.times { airport.land_plane(Plane.new) }
    expect { airport.land_plane(plane) }.to raise_error
  end

  it 'allows plane in storage to take off if it is sunny' do
    plane = Plane.new
    airport.weather(3)
    airport.land_plane(plane)
    airport.plane_take_off(plane)
    expect(airport.departed).to eql(plane)
  end

  it 'can raise error when takking off if plane has already been departed' do
    james_air_line = Plane.new
    airport.weather(3)
    airport.land_plane(james_air_line)
    airport.plane_take_off(james_air_line)
    expect { airport.plane_take_off(james_air_line) }.to raise_error
  end

  it 'does not allow plane to take off if the weather is stormy' do
    plane = Plane.new
    airport.weather(3)
    airport.land_plane(plane)
    airport.weather(5)
    expect { airport.plane_take_off(plane) }.to raise_error
  end

end
