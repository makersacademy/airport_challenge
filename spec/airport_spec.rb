require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }

  describe '#permission_to_land' do
    it { is_expected.to respond_to(:permission_to_land).with(1).argument }

    before { allow(airport).to receive(:clear?).and_return(true) }

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

    it 'informs planes when it is full' do
      airport::DEFAULT_CAPACITY.times { airport.permission_to_land(plane) }
      expect { airport.permission_to_land(plane) }.to raise_error 'Airport full'
    end

    it "tells planes when it is not safe to land" do
      allow(airport).to receive(:clear?) { false }
      expect { airport.permission_to_land(plane) }.to raise_error('unsafe weather conditions')
    end
  end

  describe '#permission_to_takeoff' do
    it { is_expected.to respond_to(:permission_to_takeoff).with(1).argument }

    before { allow(airport).to receive(:clear?).and_return(true) }

    it 'tells plane it is safe to take off' do
      expect(airport.permission_to_takeoff(plane)).to eq "You are clear for take off"
    end

    it 'removes planes from hangar' do
      airport.permission_to_land(plane)
      airport.permission_to_takeoff(plane)
      expect(airport.hangar).to be_empty
    end

    it "tells planes when it is not safe to take off" do
      allow(airport).to receive(:clear?) { false }
      expect { airport.permission_to_takeoff(plane) }.to raise_error('unsafe weather conditions')
    end
  end
end
