require 'airport'

describe Airport do

  describe '#initialize' do
    it 'should initialize with a default capacity of 5' do
      expect(subject.capacity).to eq 5
    end
    it 'should initialize with a capacity of 10 when instantiated with 10' do
      airport = Airport.new(10)
      expect(airport.capacity).to eq 10
    end
  end

  describe '#full?' do
    it 'should return true when calling full? on a full airport' do
      airport = Airport.new(0)
      expect(airport.full?).to eq true
    end
  end

  describe '#safe?' do
    it 'should return false when calling safe? when weather is stormy' do
      subject.weather('Stormy')
      expect(subject.safe?).to eq false
    end
  end
end
