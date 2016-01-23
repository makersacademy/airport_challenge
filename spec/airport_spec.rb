require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#landing' do

    it 'tell plane to land' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'check if plane has landed' do
      allow(plane).to receive(:land)
      airport.land(plane)
      expect(airport.landed_planes).to include plane
    end

  end

end
