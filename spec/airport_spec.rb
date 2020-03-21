require 'airport'

describe Airport do
  let(:standard_airport) { Airport.new }

  let(:large_airport) do 
    LARGE_CAPACITY = 20
    Airport.new(LARGE_CAPACITY)
  end

  let(:full_airport) do
    airport = Airport.new

    Airport::DEFAULT_CAPACITY.times do
      plane = Plane.new
      plane.land(airport)
    end

    airport
  end

  let(:almost_full_airport) do
    airport = Airport.new

    (Airport::DEFAULT_CAPACITY - 1).times do
      plane = Plane.new
      plane.land(airport)
    end

    airport
  end

  context 'capacity' do
    it 'has a default capacity' do
      expect(standard_airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'allows you to override its default capacity' do
      expect(large_airport.capacity).to eq LARGE_CAPACITY
    end

    it 'tells you when it is full' do
      expect(full_airport.full?).to eq true
    end

    it 'tells you when it is not full' do
      expect(almost_full_airport.full?).to eq false
    end
  end
end
