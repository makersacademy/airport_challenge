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

    it 'tells plane it is safe to land' do
      expect(airport.permission_to_land(plane)).to eq "Safe to land"
    end
  end

  describe '#permission_to_takeoff' do
    it { is_expected.to respond_to(:permission_to_takeoff).with(1).argument }

    it 'tells plane it is safe to take off' do
      expect(airport.permission_to_takeoff(plane)).to eq "You are clear for take off"
    end

    it 'removes planes from hangar' do
      airport.permission_to_land(plane)
      airport.permission_to_takeoff(plane)
      expect(airport.hangar).to be_empty
    end
  end
end
