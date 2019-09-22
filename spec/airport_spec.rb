require 'airport'
require 'plane'

describe Airport do

  subject(:airport) { described_class.new }

  it 'should have a capacity of 50 if not specified' do
    expect(airport.capacity).to eq 50
  end
  it 'should take a specified capacity' do
    airport = Airport.new(90)
    expect(airport.capacity).to eq 90
  end

  describe '#take_off' do
    it 'should instruct a plane to take off' do
      plane = double(:plane) # given
      airport.land(plane) # given
      airport.take_off(plane) # when
      expect(airport.hangar).not_to include plane # then
    end
    it 'should prevent take off if weather is stormy' do
      plane = double(:plane)
      allow(airport).to receive(:safe_conditions?) { false }
      expect { airport.take_off(plane) }.to raise_error 'Unsafe flying conditions, stay grounded'
      
    end
  end

  describe '#land'
  it 'should allow a plane to land' do
    plane = double(:plane)
    airport.land(plane)
    expect(airport.hangar).to include plane
  end
  it 'should raise an error when the airport is full' do
    plane = double(:plane)
    allow(airport).to receive(:safe_conditions?) { true }
    airport.capacity.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error "Sorry, airport is full"
  end
  it 'should prevent landing if weather is stormy' do
    plane = double(:plane)
    allow(airport).to receive(:safe_conditions?) { false }
    expect { airport.land(plane) }.to raise_error "Landing denied, conditions are unsafe"
  end

end
