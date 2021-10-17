require 'plane'

describe Plane do

  it 'land at an airport'do
    airport = Airport.new
    expect(subject.land(airport)).to respond_to.with(1).argument
  end

  it 'take_off from an airport and confirm' do
    airport = Airport.new
    expect(subject.take_off(airport)).to eq_to 'taken_off'
  end

  it 'prevent landing when the airport is full' do
    airport = Airport.new
    airport.capacity = 0
    expect(subject.land(airport)).to eq 'full'
  end
end