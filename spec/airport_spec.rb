require 'airport'

describe Airport do

  subject(:airport) {described_class.new}
  let(:plane) { double :plane}

  it{is_expected.to respond_to(:stormy?)}

  describe 'capacity' do
    it 'has default capacity on initialize' do
      expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end
    it 'can be overriden on initialize' do
      random_capacity = Random.rand(100)
      airport = described_class.new(random_capacity)
      expect(airport.capacity).to eq random_capacity
    end
  end

  describe 'plane_land' do
    it 'has landed plane' do
      airport.plane_land(plane)
      expect(airport).to_not be_empty
    end

  end

  describe 'plane_take_off' do
    it 'no longer has plane' do
      airport.plane_land(plane)
      airport.plane_take_off(plane)
      expect(airport).to be_empty
    end
  end

end
