require 'airport'

describe Airport do
  let (:plane1) { double(:plane, land: false, takeoff: true, update_location: "undefined")}
  let (:plane2) { double(:plane, land: false, takeoff: true, update_location: "undefined")}
  let (:weather) { double(:weather, weather_check: :sunny)}
  let (:test_capacity_30) { Airport.new('test_capacity', 30) }
  let (:test_full) { Airport.new('test_full',0) }
  before (:each) { allow(subject).to receive(:condition_check).and_return(:sunny)}
  before (:each) { allow(test_capacity_30).to receive(:condition_check).and_return(:sunny)}
  before (:each) { allow(test_full).to receive(:condition_check).and_return(:sunny)}

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1) }
    it 'lands a plane and adds to the hangar' do
      expect(subject.land(plane1)).to eq [plane1]
    end
    it 'should return an error if it is full' do
      expect{test_full.land(plane1)}.to raise_error "Airport is full!"
    end
  end

  describe '#takeoff' do
    it { is_expected.to respond_to(:takeoff).with(1) }
    it 'instructs a plane to take off and removes plane from hangar' do
      subject.land(plane1); subject.land(plane2)
      expect(subject.takeoff(plane1)).to eq [plane2]
    end
    it 'shouldnt allow a plane to take off if not in the hangar' do
      subject.land(plane2)
      expect{subject.takeoff(plane1)}.to raise_error "Plane is not in this airport, either land here first or add a new plane to the airport!"
    end
  end

  describe '@capacity' do
    it 'should equal default capacity on creation when not passed an arg' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it 'should modify the capacity on creation when passed an arg' do
      expect(test_capacity_30.capacity).to eq 30
    end
  end

  describe '#stormy_weather?' do
    it 'prevents planes from landing' do
      allow(subject).to receive(:condition_check).and_return(:stormy)
      expect{subject.land(:test)}.to raise_error "Stormy weather!  Try again later."
    end
    it 'prevents planes from taking off' do
      allow(subject).to receive(:condition_check).and_return(:stormy)
      expect{subject.takeoff(:test)}.to raise_error "Stormy weather!  Try again later."
    end
  end

  describe '#add_new_planes' do
    it 'should add planes to the hangar' do
      expect(subject.add_new_planes(plane1)).to eq [plane1]
    end
  end
end



















