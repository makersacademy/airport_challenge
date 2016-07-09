require 'airport'

describe Airport do

  it { is_expected.to respond_to :capacity }

  describe '#capacity' do

    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'allows user to set @capacity' do
      airport = Airport.new 10
      expect(airport.capacity).to eq(10)
    end

  end

end
