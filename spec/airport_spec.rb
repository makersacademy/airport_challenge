require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }

  describe '#permission_to_land' do
    it { is_expected.to respond_to(:permission_to_land).with(1).argument }

    it 'Stores planes in hangar' do
      airport.permission_to_land(plane)
      expect(airport.hangar[0]).to eq plane
    end

    it 'Can only store Planes' do
      airport.permission_to_land(plane)
      allow(plane).to receive(:class) { Plane }
      expect(airport.hangar[0].class).to eq Plane
    end
  end

end
