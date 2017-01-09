require 'airport'
require 'weather'
require 'plane'

describe Airport do

  it {expect(subject.class).to eq(Airport)}
  it {is_expected.to respond_to(:arrivals)}
  it {is_expected.to respond_to(:departures)}
  it {is_expected.to respond_to(:airport_full)}
  it {is_expected.to respond_to(:airport_empty?)}
  it {is_expected.to respond_to(:capacity)}
  it {is_expected.to respond_to(:planes)}

  it 'arrival with proper weather' do
    allow(Weather).to receive(:stormy_weather?) { false }
    expect(subject.arrivals.empty?).to eq(false)
  end

  it 'arrival with stormy weather' do
    allow(Weather).to receive(:stormy_weather?) { true }
    expect {subject.arrivals}.to raise_error("Bad weather conditions to land")
  end

  it 'depature with proper weather' do
    airport = subject
    allow(Weather).to receive(:stormy_weather?) { false }
    airport.arrivals
    expect(airport.departures.empty?).to eq(true)
  end

  it 'depature with stormy weater' do
    airport = subject
    airport.planes << Plane.new
    allow(Weather).to receive(:stormy_weather?) { true }
    expect {airport.departures}.to raise_error("Bad weather conditions to depart")
  end

  it 'airport empty' do
    expect {subject.departures}.to raise_error("No planes landed")
  end

  it 'does not land if airport full' do
    if !Weather.stormy_weather?
      airport = subject
      capacity = airport.capacity
      capacity.times {airport.arrivals}
      expect {airport.arrivals}.to raise_error("Airport is full")
    end
  end

  it 'change capacity' do
    new_capacity = 30
    expect(subject.capacity(new_capacity)).to eq(new_capacity)
  end

end
