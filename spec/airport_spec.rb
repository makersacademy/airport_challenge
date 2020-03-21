require 'airport'

describe Airport do
  let(:standard_airport) { Airport.new }

  let(:large_airport) do 
    LARGE_CAPACITY = 20
    Airport.new(LARGE_CAPACITY)
  end

  context 'capacity' do
    it 'tells you when it is full' do
      subject.full = true
      expect(subject.full?).to eq true
    end

    it 'has a default capacity' do
      expect(standard_airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'allows you to override its default capacity' do
      expect(large_airport.capacity).to eq LARGE_CAPACITY
    end
  end
end
