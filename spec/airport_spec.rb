require 'airport'
require 'plane'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double(:plane, :plane_landed => false) }

  it 'should have a capacity of 50 if not specified' do
    expect(airport.capacity).to eq 50
  end
  it 'should take a specified capacity' do
    airport = Airport.new(90)
    expect(airport.capacity).to eq 90
  end

  describe '#takeoff' do
    it 'should instruct a plane to take off' do
      allow(airport).to receive(:safe_conditions?) { true }
      airport.land(plane) # given
      airport.takeoff(plane) # when
      expect(airport.hangar).not_to include plane # then
    end
    it 'should prevent take off if weather is stormy' do
      allow(airport).to receive(:safe_conditions?) { false }
      expect { airport.takeoff(plane) }.to raise_error 'Unsafe flying conditions, stay grounded'
    end
    it 'should only work from the airport in which the plane is located' do
      city = Airport.new
      allow(city).to receive(:safe_conditions?) { true }
      allow(airport).to receive(:safe_conditions?) { true }
      city.land(plane)
      expect(airport.takeoff(:plane)).to eq nil
    end
  end

  describe '#land' do
    it 'should allow a plane to land' do
      allow(airport).to receive(:safe_conditions?) { true }
      allow(plane).to receive(:flying?) { true }
      airport.land(plane)
      expect(airport.hangar).to include plane
    end
    it 'should raise an error when the airport is full' do
      allow(airport).to receive(:safe_conditions?) { true }
      airport.capacity.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error "Sorry, airport is full"
    end
    it 'should prevent landing if weather is stormy' do
      allow(airport).to receive(:safe_conditions?) { false }
      expect { airport.land(plane) }.to raise_error "Landing denied, conditions are unsafe"
    end
  end
end
