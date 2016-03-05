require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:airplane) { double :airplane }
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
    # it 'instructs a plane to land' do
    #   allow(airplane).to receive(:land)
    #   shane_airport = airport
    #   airport.land_plane(airplane)
    #   expect(airport).to respond_to(:land_plane).with(1).argument
    # end

    it 'raises an error when plane cannot land' do
      message = "Cannot land due to inclement weather."
      expect{ airport.land_plane(:airplane) }.to raise_error message
    end
  end

  # it 'is expected to have a airplane capacity' do
  #   airport()
  #
end
