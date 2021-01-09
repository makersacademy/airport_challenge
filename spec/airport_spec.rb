require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new(20) }
  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it 'will confirm that the plane is no longer in the airport' do
    plane = Plane.new
    expect(airport.take_off(plane)).to eq "The plane: #{plane} has taken off"
  end

  it 'will instruct a plane to land at an airport' do
    plane = Plane.new
    expect(airport.land(plane)).to include(plane)
  end

  it 'will prevent landing when the airport is full' do
    airport = Airport.new(5)
    5.times { airport.land Plane.new }
    expect { airport.land Plane.new }.to raise_error "Airport is full"
  end

  it 'will have a default airport capacity that can be overridden as appropriate' do
    airport = Airport.new
    Airport::DEFAULT_CAPACITY.times { airport.land Plane.new }
    expect { airport.land Plane.new }.to raise_error "Airport is full"
  end
end
