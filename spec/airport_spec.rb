require 'airport'
require 'weather'
require 'plane'

describe Airport do

  it {expect(subject.class).to eq(Airport)}
  it {is_expected.to respond_to(:arrivals)}
  it {is_expected.to respond_to(:departures)}
  it {is_expected.to respond_to(:bad_conditions?)}
  it {is_expected.to respond_to(:airport_full)}
  it {is_expected.to respond_to(:airport_empty?)}
  it {is_expected.to respond_to(:capacity)}
  it {is_expected.to respond_to(:planes)}

  it 'arriving' do
    if Weather.stormy_weather?
      expect {subject.arrivals}.to raise_error("Bad weather conditions to land")
    else
      expect(subject.arrivals.empty?).to eq(false)
    end
  end

  it 'departing' do
    airport = subject
    if Weather.stormy_weather?
      airport.planes << Plane.new
      expect {airport.departures}.to raise_error("Bad weather conditions to depart")
    else
      airport.arrivals
      expect(airport.departures.empty?).to eq(true)
    end
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
