require 'air_traffic_control'

describe AirTrafficControl do
  subject(:AirTrafficControl) {described_class.new}
	let(:plane) { double :plane }
  let(:airport) { double :airport }

#responds to methods in class
  it { is_expected.to respond_to :instruct_land }
  it { is_expected.to respond_to :instruct_takeoff }

#instruct a plane to land
  describe '#instruct_land' do
    it 'returns plane removed from inflight' do
      allow(subject).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:land)
      allow(airport).to receive(:full?).and_return(false)
      subject.instruct_takeoff(plane, airport)
      expect(subject.instruct_land(plane, airport)).to eq plane
    end
  end

  describe '#instruct_land' do
    it 'check plane no longer inflight' do
      allow(subject).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:land)
      allow(airport).to receive(:full?).and_return(false)
      subject.instruct_takeoff(plane, airport)
      subject.instruct_land(plane, airport)
 	    expect(subject.display_inflight).not_to include(plane)
    end
  end

  describe '#instruct_land' do
    it 'check plane class receives instruction to land' do
      allow(plane).to receive(:land)
      allow(airport).to receive(:full?).and_return(false)
      expect(plane).to receive(:land)
      subject.instruct_land(plane, airport)
    end
  end

#prevent landing if stormy
  describe '#instruct_land' do
    it 'display error if stormy' do
      allow(subject).to receive(:stormy?).and_return(true)
      allow(plane).to receive(:land)
      allow(airport).to receive(:full?).and_return(false)
      expect { subject.instruct_land(plane, airport) }.to raise_error('Too stormy to land')
    end
  end


#prevent landing if airport is full
  describe '#instruct_land' do
    it 'display error if airport is full' do
      allow(subject).to receive(:stormy?).and_return(true)
      allow(plane).to receive(:land)
      allow(airport).to receive(:full?).and_return(true)
      expect { subject.instruct_land(plane, airport) }.to raise_error('Too stormy to land')
    end
  end

  describe '#instruct_land' do
    it 'check airport class for full?' do
      allow(plane).to receive(:land)
      allow(airport).to receive(:full?)
      expect(airport).to receive(:full?)
      subject.instruct_land(plane, airport)
    end
  end

#instruct plane to take-off


#confirm plane has taken off


#prevent take-off if stormy


#

end
