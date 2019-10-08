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
    weather = double(:weather, :condition => 'good')
    airport.weather = weather.condition
    airport.land(plane_unqie)
    expect(airport.plane_storage).to include(plane_unqie)
  end

  it 'intructs plane to take off from an airport.' do
    weather = double(:weather, :condition => 'good')
    airport.weather = weather.condition
    airport.plane_storage << plane_unqie
    airport.take_off(plane_unqie)
    expect(airport.plane_storage).not_to include(plane_unqie)
  end

  it 'confirm a plane that has taken off is no longer at the airport.' do
    weather = double(:weather, :condition => 'stormy')
    airport.weather = weather.condition
    airport.plane_status(plane)
  end

  it 'prevents the landing of a plane when the airport is full.' do
    weather = double(:weather, :condition => 'good')
    airport.weather = weather.condition
    airport.capacity.times { airport.plane_storage << plane }
    expect { airport.land(plane) }.to raise_error("Airport is at max capacity!!!ABORT!")
  end

  it 'prevents takeoff when weather is stormy' do
    weather = double(:weather, :condition => 'stormy')
    airport.weather = weather.condition
    expect { airport.take_off(plane) }.to raise_error("BAD WEATHER, ALL PLANES GROUNDED")
  end

  it 'prevents landing when weather is stormy' do
    weather = double(:weather, :condition => 'stormy')
    airport.weather = weather.condition
    expect { airport.land(plane) }.to raise_error("BAD WEATHER, ALL PLANES GROUNDED")
  end

  it 'default airport capacity that can be overridden as appropriate' do
    weather = double(:weather, :condition => 'stormy')
    airport.weather = weather.condition
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
