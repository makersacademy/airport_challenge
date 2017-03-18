require 'airport'

describe Airport do

  subject (:plane) { described_class.new }
  subject (:weather) { described_class.new }

  describe '#initialize' do
    it 'checks default capacity is set' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'checks default capacity can be overridden' do
      subject = Airport.new(80)
      expect(subject.capacity).to eq 80
    end
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'can confirm a plane has landed' do
      allow(plane).to receive(:flying?) {true}
      allow(plane).to receive(:plane_lands)
      subject.land(plane)
      expect(subject.planes_in_airport).to include plane
    end

    it 'cannot land a plane that is not flying' do
      allow(plane).to receive(:flying?) {false}
      expect{subject.land(plane)}.to raise_error("Plane is on the ground")
    end

    it 'does not allow landing when airport is full' do
      allow(plane).to receive(:flying?) {true}
      subject.capacity.times {subject.planes_in_airport << plane}
      expect{subject.land(plane)}.to raise_error("Airport is full")
    end

  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'can confirm plane is no longer in the airport' do
      allow(plane).to receive(:flying?) {false}
      allow(plane).to receive(:plane_takes_off)
      allow(weather).to receive(:stormy?) {false}
      subject.planes_in_airport << plane
      subject.take_off(plane)
      expect(subject.planes_in_airport).not_to include plane
    end

    it 'cannot make a plane takeoff if it is flying' do
      allow(plane).to receive(:flying?) {true}
      expect{subject.take_off(plane)}.to raise_error("Plane is in the air")
    end

    it 'planes can only takeoff from airports they are in' do
      allow(plane).to receive(:flying?) {false}
      allow(plane).to receive(:plane_takes_off)
      airport2 = Airport.new
      airport2.planes_in_airport << plane
      expect{subject.take_off(plane)}.to raise_error("Plane not in airport")
    end
  end

  context 'stormy weather' do
    it 'prevents takeoff when weather is stormy' do
      allow(plane).to receive(:flying?) {false}
      allow(weather).to receive(:stormy?) {true}
      allow(plane).to receive(:plane_takes_off)
      subject.planes_in_airport << plane
      expect{subject.take_off(plane)}.to raise_error("Too stormy to take off")
    end

    it 'prevents landing when weather is stormy' do
      allow(plane).to receive(:flying?) {true}
      allow(weather).to receive(:stormy?) {true}
      allow(plane).to receive(:plane_lands)
      expect{subject.land(plane)}.to raise_error("Too stormy to land")
    end
  end


end
