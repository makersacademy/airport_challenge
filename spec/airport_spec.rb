require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  describe '#capacity' do
    it 'is expected to have a default capacity' do
      shane_airport = airport
      expect(shane_airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'is expected to have a user-specified capacity' do
      shane_airport = Airport.new(40)
      expect(shane_airport.capacity).to eq 40
    end
  end

  describe '#land_plane' do
    it 'instructs a plane to land' do
      allow(plane).to receive(:land)
      airport.land_plane(plane)
    end

    it 'confirms that the plane has landed' do
      allow(plane).to receive(:land)
      airport.land_plane(plane)
      expect(subject.planes).to include plane
    end
  end

  # it 'is expected to have a airplane capacity' do
  #   airport()
  #
end
