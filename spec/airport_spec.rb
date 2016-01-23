require 'airport'

describe Airport do

  describe '#initialize' do

      it {is_expected.to respond_to :planes}

      it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
      end

      it 'has a default capacity that can be changed' do
        expect(Airport.new(6).capacity).to eq 6
      end

  end

  describe '#at_capacity?' do

    let(:plane) { double(:plane, :airborne => true)}

    it 'returns true if the airport is at capaicty' do
      airport = Airport.new(2)
      p1 = double(:plane, :airborne => false)
      p2 = double(:plane, :airborne => false)
      airport.planes << p1
      airport.planes << p2
      expect(airport.at_capacity?).to be true
    end

  end

end
