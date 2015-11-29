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
      Airport::DEFAULT_CAPACITY.times{airport.stored_planes<<plane}
      expect(airport).to be_full
    end
  end


end
