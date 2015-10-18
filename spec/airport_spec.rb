require 'airport'

describe Airport do
  let (:plane1) { double(:plane, land: false, takeoff: true, update_location: "undefined")}
  let (:plane2) { double(:plane, land: false, takeoff: true, update_location: "undefined")}
  let (:plane3) { double(:plane, land: false, takeoff: true, update_location: "undefined")}
  let (:plane4) { double(:plane, land: false, takeoff: true, update_location: "undefined")}
  let (:plane5) { double(:plane, land: false, takeoff: true, update_location: "undefined")}
  let (:test_capacity_30) { Airport.new('test_capacity', 30) }
  let (:test_full) { Airport.new('test_full',-1) }

# As an air traffic controller
# So planes can land safely at my airport
# I would like to instruct a plane to land
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1) }
    it 'lands a plane and adds to the hangar' do
      allow(subject).to receive(:stormy_weather?).and_return(false)
      expect(subject.land(plane1)).to eq [plane1]
    end
    it 'should return an error if it is full' do
      allow(test_full).to receive(:stormy_weather?).and_return(false)
      expect{test_full.land(plane1)}.to raise_error "Airport is full!"
    end
  end


# As an air traffic controller
# So planes can take off safely from my airport
# I would like to instruct a plane to take off
  describe '#takeoff' do
    it { is_expected.to respond_to(:takeoff).with(1) }
    it 'instructs a plane to take off and removes plane from hangar' do
      allow(subject).to receive(:stormy_weather?).and_return(false)
      subject.land(plane3); subject.land(plane4)
      expect(subject.takeoff(plane3)).to eq [plane4]
    end
    it 'shouldnt allow a plane to take off if not in the hangar' do
      subject.land(plane2)
      expect{subject.takeoff(plane1)}.to raise_error "Plane not in this airport!"
    end
  end

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate
  describe 'CAPACITY' do
    it 'should equal default capacity on creation when not passed an arg' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it 'should modify the capacity on created when passed an arg' do
      expect(test_capacity_30.capacity).to eq 30
    end
  end

# As an air traffic controller
# So that I can avoid accidents
# I want to prevent airplanes landing or taking off when the weather is stormy
  describe '#stormy_weather?' do
    it 'should return true when the weather is stormy' do
      allow(Random).to receive(:rand).and_return(0)
      expect(subject.stormy_weather?).to eq true
    end
    it 'prevents planes from landing' do
      allow(subject).to receive(:stormy_weather?).and_return(true)
      expect{subject.land(:test)}.to raise_error "Stormy weather!  Try again later."
    end
    it 'prevents planes from taking off' do
      allow(subject).to receive(:stormy_weather?).and_return(true)
      expect{subject.takeoff(:test)}.to raise_error "Stormy weather!  Try again later."
    end
  end
end



















