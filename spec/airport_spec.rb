require 'airport'
require 'plane'
require 'weather'

describe Airport do

  it 'if it is stormy, do not let a plane land' do
    airport = Airport.new(double(:weather, stormy?: true))
    expect { airport.land(:plane) }.to raise_error "too stormy to land!"
  end

  it 'if it is sunny, let a plane take off' do
    airport = Airport.new(double(:weather, stormy?: false))
    airport.land(:plane)
    expect { airport.take_off }.not_to raise_error
  end

  it "if Airport is empty, it does not allow a plane to take off" do
    expect { Airport.new(double(:weather, stormy?: false)).take_off }.to raise_error "Airport is empty!"
  end

  it "Airport has default capacity" do
    airport = Airport.new(double(:weather, stormy?: false))
    expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  it "Airport has a set capacity" do
    airport = Airport.new(double(:weather, stormy?: false), 20)
    expect(airport.capacity).to eq(20)
  end

  it "if Airport is full, it does not allow a plane to take off" do
    airport = Airport.new(double(:weather, stormy?: false))
    airport.capacity.times { airport.land(:plane) }
    expect { airport.land(:plane) }.to raise_error "Airport is full!"
  end

end
