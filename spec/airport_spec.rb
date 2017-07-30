require 'airport'

describe Airport do

  subject(:airport) {described_class.new}
  let(:plane) { Plane.new } # use double??

  describe '#land_plane' do
    it 'instructs plane to land' do
      allow(airport).to receive(:stormy?).and_return false # stub method :stormy? to set airport SUNNY (NOT STORMY)
      expect(airport).to respond_to(:land_plane).with(1).argument
    end

    it 'raises error when weather is stormy' do
      allow(airport).to receive(:stormy?).and_return true # stub method :stormy? to set airport stormy
      expect { airport.land_plane(plane) }.to raise_error 'Weather stormy. Plane can not land!'
    end
  end

  describe '#take_off' do
    it 'instructs plane to take-off' do
      allow(airport).to receive(:stormy?).and_return false # stub method :stormy? to set airport SUNNY (NOT STORMY)
      expect(airport).to respond_to(:take_off).with(1).argument
    end

    it 'raises error when weather is stormy' do
      allow(airport).to receive(:stormy?).and_return true # stub method :stormy? to set airport stormy
      expect { airport.take_off(plane) }.to raise_error 'Weather stormy. Plane can not take-off!'
    end
  end
end
