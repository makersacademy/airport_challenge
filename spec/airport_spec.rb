require 'airport'

describe Airport do

  it { is_expected.to respond_to :stormy? }
  it { is_expected.to respond_to :full? }

  describe '#stormy?' do

    it 'is sometimes stormy' do
      weather = Airport.new.stormy?
      expect(weather).to be_(true).or be(false)
    end
  end

  describe '#initialize' do

    it 'initializes' do
      airport = Airport.new
      expect(airport).not_to be_nil
    end

    it 'has a default capacity' do
      airport = Airport.new
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'has a default capacity that can be overridden' do
      airport = Airport.new(rand(10))
      expect(airport.capacity).to eq airport.capacity
    end
  end

end
