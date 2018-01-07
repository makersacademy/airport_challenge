require 'airport'

describe Airport do
  subject(:airport) { Airport.new }
  let(:plane) { double :plane }

  it { is_expected.to respond_to(:planes) }

  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#land' do
    it 'confirms plane has landed' do
      airport.land(plane)
      expect(airport.planes).to include plane
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'lets a plane to take off from the airport' do
      airport.take_off(plane)
      expect(airport.planes).to eq([])
    end
  end
end
