require 'airport'
require 'plane'

describe Airport do
  let(:plane) { double :plane }
  before(:each) { allow(subject.weather).to receive(:is_stormy) { false }}

  describe '#responsiveness' do
    it { is_expected.to respond_to(:land_plane).with(1).argument  }
    it { is_expected.to respond_to(:takeoff_plane).with(1).argument  }
    it { is_expected.to respond_to(:weather) }
    it { is_expected.to respond_to(:capacity) }
  end

  describe '#stormy?' do
    it 'can check if weather is stormy' do
      expect(subject.stormy?).to satisfy { |stormy| stormy == true || stormy == false}
    end
  end

  describe '#land_plane' do
    it 'should allow plane to land at airport' do
      allow(plane).to receive(:landed) {false}
      allow(plane).to receive(:airborne?) {false}
      expect(plane.airborne?).to eq false
    end

    it 'should only allow airborne planes to land' do
      allow(plane).to receive(:airborne?) {false}
      expect{subject.land_plane(plane)}.to raise_error{"Plane is already landed"}
    end

    it 'should confirm that plane has landed' do
      allow(plane).to receive(:airborne?) {true}
      allow(plane).to receive(:landed) {false}
      expect(subject.land_plane(plane)).to eq "#{plane} has completed landing"
    end

    it 'should not allow landing when airport is full' do
      allow(plane).to receive(:airborne?) {true}
      allow(plane).to receive(:landed) {false}
      subject.capacity.times { subject.land_plane plane }
      expect {subject.land_plane(plane)}.to raise_error{"Airport is full!"}
    end

    it 'should not allow plane to land when stormy' do
      allow(subject.weather).to receive(:is_stormy) { false }
      expect {subject.land_plane(plane)}.to raise_error{"Weather is too stormy for landing"}
    end
  end

  describe '#takeoff_plane' do
    it 'should allow plane to takeoff from airport' do
      subject.hangar << plane
      allow(plane).to receive(:takeoff) {true}
      allow(plane).to receive(:airborne?) {true}
      expect(plane).to be_airborne
    end

    it 'should only allow landed planes to takeoff' do
      allow(plane).to receive(:airborne?) {true}
      expect{subject.takeoff_plane(plane2)}.to raise_error{"Plane is already airborne"}
    end

    it 'should confirm that plane has taken off' do
      subject.hangar << plane
      allow(plane).to receive(:airborne?) {false}
      allow(plane).to receive(:takeoff) {true}
      expect(subject.takeoff_plane(plane)).to eq "#{plane} has taken off"
    end


    it 'allows planes to takeoff from only airports they are landed in' do
      airport1 = Airport.new
      airport2 = Airport.new
      airport1.hangar << plane
      allow(plane).to receive(:airborne?) {false}
      expect{airport1.takeoff_plane(plane2)}.to raise_error{"#{plane} is not in hangar"}
    end

    it 'should not allow planes to takeoff when stormy' do
      allow(subject.weather).to receive(:is_stormy) { false }
      expect {subject.takeoff_plane(plane)}.to raise_error{"Weather is too stormy for takeoff"}
    end

  end

  describe '#capacity' do
    it 'allows a new airport to be created with a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'allows default capacity to be overriden' do
      subject.capacity = 40
      expect(subject.capacity).to eq 40
    end
  end


end
