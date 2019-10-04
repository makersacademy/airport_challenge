require 'air_control.rb'
describe Airport do
  subject(:airport) { described_class.new }
  subject(:weather) { Weather.new }
  let(:plane) { double :plane }
  let(:plane_unqie) { double :"8457" }
  before do
    airport.plane_storage << plane
  end
  it 'instructs a plane to land at an airport.' do
    airport.land(plane_unqie)
    expect(airport.plane_storage).to include(plane)
  end

  it 'intructs plane to take off from an airport.' do
    airport.plane_storage << plane_unqie
    airport.take_off
    expect(airport.plane_storage).not_to include(plane_unqie)
  end

  it 'confirm a plane that has taken off is no longer at the airport.' do
    airport.plane_status(plane)
  end

  it 'prevents the landing of a plane when the airport is full.' do
    airport.capacity.times { airport.plane_storage << plane }
    expect { airport.land(plane) }.to raise_error("Airport is at max capacity!!!ABORT!")
  end

  xit 'prevents takeoff when weather is stormy' do
    condition = double :condition
    # condition = double(false)
    expect { airport.take_off }.to raise_error("BAD WEATHER, ALL PLANES GROUNDED")
  end

  xit 'prevents landing when weather is stormy' do
    airport.land(plane)
    expect { airport.weather }.to raise_error("BAD WEATHER, ALL PLANES GROUNDED")
  end

  it 'default airport capacity that can be overridden as appropriate' do
    airport = Airport.new(50)
    airport.capacity.times { airport.plane_storage << plane }
    expect { airport.land(plane) }.to raise_error("Airport is at max capacity!!!ABORT!")
  end
end

describe Plane do
  it 'an instance of plane is any integer' do
    expect(subject.plane).to be_an(Integer)
  end
end
