require 'airport'

describe Airport do
  let(:airport) {described_class.new}
  let(:plane) {double(:plane)}

  describe '#stored_planes' do

    it 'is an empty array by default' do
      expect(airport.stored_planes).to be_empty
    end
  end

  describe '#full?' do
    it 'returns true if airport is full' do
      plane = double(:plane, land: plane)
      airport.capacity.times{airport.stored_planes<<plane}
      expect(airport).to be_full
    end
  end

  describe 'capacity' do

    it 'has a default' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'can be overridden on initialize' do
      random_capacity = Random.rand(100)
      airport = described_class.new random_capacity
      expect(airport.capacity).to eq random_capacity
    end
  end

  context 'Storm' do
    it 'means airport has storm' do
      airport = described_class.new 20, double(:weather, stormy?: true)
      expect(airport).to be_stormy
    end
  end


end
