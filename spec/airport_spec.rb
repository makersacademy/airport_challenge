require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  describe '#land' do
    it 'instructs a plane to land at the airport itself' do
      expect(plane).to receive(:land_at).with(airport)
      airport.land plane
    end

    it 'contains the landed plane' do
      allow(plane).to receive(:land_at).with(airport)
      airport.land plane
      expect(airport.planes).to include plane
    end
  end

  describe '#take_off' do
    before do
      allow(plane).to receive(:land_at).with(airport)
      airport.land plane
    end

    it 'instructs a landed plane to take off from the airport' do
      expect(plane).to receive(:take_off)
      airport.take_off plane
    end

    it 'no longer contains a plane that was instructed to take off' do
      allow(plane).to receive(:take_off)
      airport.take_off plane
      expect(airport.planes).not_to include(plane)
    end
  end



end
