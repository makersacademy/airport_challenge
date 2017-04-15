require 'weather'
require 'airport'
require 'airplane'

describe Weather do
  it 'should raise error when #stormy?' do
    expect { !subject.stormy? }.to raise_error "No taking off allowed while weather is stormy."
  end

  it 'planes should not #take_off when #stormy?' do
    airport = Airport.new
    plane = Airplane.new
    airport.land(plane)
    expect { airport.take_off }.to raise_error "No taking off allowed while weather is stormy." if subject.stormy?
  end

  it 'planes should not #land when #stormy?' do
    airport = Airport.new
    plane = Airplane.new
    expect { airport.land(plane) }.to raise_error "No taking off allowed while weather is stormy." if subject.stormy?
  end
end
