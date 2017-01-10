require 'airport'
require 'weather'
require 'plane'


describe Airport do

  it {is_expected.to respond_to(:arrivals)}
  it {is_expected.to respond_to(:departures)}
  it {is_expected.to respond_to(:airport_full)}
  it {is_expected.to respond_to(:airport_empty?)}
  it {is_expected.to respond_to(:planes)}
  it {is_expected.to respond_to(:capacity)}

  it 'arrival with proper weather' do
    airport = Airport.new
    allow(airport.weather).to receive(:stormy?).and_return(false)
    expect(airport.arrivals.empty?).to eq(false)
  end

  it 'arrival with stormy weather' do
    airport = Airport.new
    allow(airport.weather).to receive(:stormy?) { true }
    error_message = "Bad weather conditions to land"
    expect {airport.arrivals}.to raise_error(error_message)
  end

  it 'depature with proper weather' do
    airport = Airport.new
    allow(airport.weather).to receive(:stormy?) { false }
    airport.arrivals
    airport.departures
    expect(airport.planes.empty?).to eq(true)
  end

  it 'depature with stormy weater' do
    airport = Airport.new
    airport.planes << Plane.new
    allow(airport.weather).to receive(:stormy?) { true }
    error_message = "Bad weather conditions to depart"
    expect {airport.departures}.to raise_error(error_message)
  end

  it 'airport empty' do
    error_message = "No planes landed"
    expect {subject.departures}.to raise_error(error_message)
  end

  it 'does not land if airport full' do
    airport = Airport.new
    allow(airport.weather).to receive(:stormy?) { false }
    capacity = airport.capacity
    capacity.times {airport.arrivals}
    error_message = "Airport is full"
    expect {airport.arrivals}.to raise_error(error_message)
  end

  it 'change capacity' do
    airport = Airport.new
    new_capacity = 30
    airport.capacity = new_capacity
    expect(airport.capacity).to eq(new_capacity)
  end

end
