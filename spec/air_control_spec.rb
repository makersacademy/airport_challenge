require 'air_control.rb'
describe Airport do
  subject(:airport) { described_class.new }
  subject(:weather) { Weather.new }
  let(:plane) { double :plane }
  let(:plane_unique) { double :"8457" }
  before do
    airport.plane_storage << plane
  end
  it 'instructs a plane to land at an airport.' do
    weather = double(:weather, :condition => 'good')
    airport = Airport.new(20, weather)
    airport.land(plane_unique)
    expect(airport.plane_storage).to include(plane_unique)
  end

  it 'intructs plane to take off from an airport.' do
    weather = double(:weather, :condition => 'good')
    airport = Airport.new(20, weather)
    airport.plane_storage << plane_unique
    airport.take_off(plane_unique)
    expect(airport.plane_storage).not_to include(plane_unique)
  end

  it 'confirm a plane that has taken off is no longer at the airport.' do
    weather = double(:weather, :condition => 'good')
    airport = Airport.new(20, weather)
    airport.plane_status(plane_unique)
  end

  it 'prevents the landing of a plane when the airport is full.' do
    weather = double(:weather, :condition => 'good')
    airport = Airport.new(20, weather)
    airport.capacity.times { airport.plane_storage << plane }
    expect { airport.land(plane) }.to raise_error("Airport is at max capacity!!!ABORT!")
  end

  it 'prevents takeoff when weather is stormy' do
    weather = double(:weather, :condition => 'stormy')
    airport = Airport.new(20, weather)
    expect { airport.take_off(plane) }.to raise_error("BAD WEATHER, ALL PLANES GROUNDED")
  end

  it 'prevents landing when weather is stormy' do
    weather = double(:weather, :condition => 'stormy')
    airport = Airport.new(20, weather)
    expect { airport.land(plane) }.to raise_error("BAD WEATHER, NO LANDING")
  end

  it 'default airport capacity that can be overridden as appropriate' do
    weather = double(:weather, :condition => 'good')
    airport = Airport.new(50, weather)
    airport.capacity.times { airport.plane_storage << plane }
    expect { airport.land(plane) }.to raise_error("Airport is at max capacity!!!ABORT!")
  end
end
