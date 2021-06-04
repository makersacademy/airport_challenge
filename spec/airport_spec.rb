require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument}
  it { is_expected.to respond_to(:take_off).with(1).argument }

  describe '#land' do
    it 'instructs a plane to land' do
      expect(plane).to receive(:land)

      airport.land(plane)

      # expect(airport.planes).to include plane
    end
  end
end
end