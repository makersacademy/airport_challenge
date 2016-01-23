require 'airport'

describe Airport do

  describe '#initialize' do

      it {is_expected.to respond_to :planes}
      it {is_expected.to respond_to :capacity}

      it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
      end

      it 'has a default capacity that can be changed' do
        expect(Airport.new(6).capacity).to eq 6
      end

  end

  describe '#at_capacity?' do

    let(:plane) { double(:plane, :airborne => true)}

    it {is_expected.to respond_to :at_capacity?}

    it 'returns true if the airport is at capacity' do
      airport = Airport.new(2)
      p1 = double(:plane, :airborne => false)
      p2 = double(:plane, :airborne => false)
      airport.planes << p1
      airport.planes << p2
      expect(airport.at_capacity?).to be true
    end

    it 'returns false if the airport is not at capacity' do
      airport = Airport.new(2)
      p1 = double(:plane, :airborne => false)
      airport.planes << p1
      expect(airport.at_capacity?).to be false
    end

  end

  describe 'weather_conditions' do

    it {is_expected.to respond_to :weather_conditions}

    it 'returns an Integer to represent the weather conditions' do
      expect(subject.weather_conditions).to be_a(Integer)
    end

  end

end
