require 'airport'
require 'plane'

describe Airport do
  let(:plane) { double :plane }
  subject(:airport) { described_class.new }
  before(:each) { allow(airport).to receive(:stormy?) { false }}
  before(:each) { allow(plane).to receive(:instance_of?) { true }}

  describe '#responsiveness' do
    it { is_expected.to respond_to(:land_plane).with(1).argument  }
    it { is_expected.to respond_to(:takeoff_plane).with(1).argument  }
    it { is_expected.to respond_to(:weather) }
    it { is_expected.to respond_to(:capacity) }
  end

  context '#stormy?' do
    before(:each) { allow(airport).to receive(:stormy?) { true }}

    it 'can check if weather is stormy' do
      expect(airport).to be_stormy
    end

    it 'should not allow planes to land when stormy' do
      plane = Plane.new
      expect {airport.land_plane(plane)}.to raise_error{"Weather is too stormy for landing"}
    end

    it 'should not allow planes to takeoff when stormy' do
      plane = Plane.new
      plane.landed
      airport.hangar << plane
      expect {airport.takeoff_plane(plane)}.to raise_error{"Weather is too stormy for takeoff"}
    end

  end

  describe '#land_plane' do
    before(:each) { allow(plane).to receive(:airborne?) { true }}

    it 'raises error if something other than plane tries to land' do
      expect{airport.land_plane('boat')}.to raise_error{"That is not a plane, sorry!"}
    end

    it 'should allow plane to land in airport' do
      allow(plane).to receive(:landed) {'landed'}
      expect(airport.land_plane(plane)).to eq "#{plane} has completed landing"
    end

    it 'should only allow airborne planes to land' do
      allow(plane).to receive(:airborne?) {false}
      expect{airport.land_plane(plane)}.to raise_error{"Plane is already landed"}
    end

    it 'should not allow landing when airport is full' do
      allow(plane).to receive(:landed) {'landed'}
      airport.capacity.times { subject.land_plane plane }
      expect {airport.land_plane(plane)}.to raise_error{"Airport is full!"}
    end

  end

  describe '#takeoff_plane' do
    before(:each) { allow(plane).to receive(:airborne?) { false }}

    it 'should only allow landed planes to takeoff' do
      allow(plane).to receive(:airborne?) {true}
      expect{airport.takeoff_plane(plane2)}.to raise_error{"Plane is already airborne"}
    end

    it 'should confirm that plane has taken off' do
      airport.hangar << plane
      allow(plane).to receive(:takeoff) {'airborne'}
      expect(airport.takeoff_plane(plane)).to eq "#{plane} has taken off"
    end

    it 'allows planes to takeoff from only airports they are landed in' do
      airport1 = Airport.new
      airport2 = Airport.new
      airport1.hangar << plane
      expect{airport1.takeoff_plane(plane2)}.to raise_error{"Plane is not in hangar"}
    end

  end

  describe '#capacity' do
    it 'allows a new airport to be created with a default capacity' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'allows default capacity to be overriden' do
      airport.capacity = 40
      expect(airport.capacity).to eq 40
    end
  end


end
