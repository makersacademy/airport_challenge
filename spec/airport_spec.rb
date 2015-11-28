require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it 'instructs the plane to land' do
      expect(plane).to receive(:land)
      airport.land plane
    end
    it 'has the plane after it has landed' do
      allow(plane).to receive(:land)
      airport.land plane
      expect(airport.planes).to include plane
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    before do
      allow(plane).to receive(:land)
      airport.land plane
    end
    it 'instructs the plane to take off' do
      expect(plane).to receive(:take_off)
      airport.take_off plane
    end
    it 'does not have the plane after it took off' do
      allow(plane).to receive(:take_off)
      airport.take_off plane
      expect(airport.planes).not_to include plane
    end
  end

end
