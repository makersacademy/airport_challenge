require 'airport'

describe Airport do

  #lookup benefits of naming subjects explicitly
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
    it 'has plane after it has landed' do
      plane = double(:plane, flying?: true)
      allow(plane).to receive(:plane_lands)
      allow(weather).to receive(:stormy?) {false}
      subject.land(plane)
      expect(subject.planes_in_airport).to include plane
    end

    it 'cannot land a plane that is not flying' do
      plane = double(:plane, flying?: false)
      expect{subject.land(plane)}.to raise_error("Plane is on the ground")
    end

    it 'does not allow landing when airport is full' do
      plane = double(:plane, flying?: true)
      subject.capacity.times {subject.planes_in_airport << plane}
      expect{subject.land(plane)}.to raise_error("Airport is full")
    end

  end

  describe '#take_off' do
    # How to create plane double first??
    # before do
    #   allow(plane).to receive(:plane_takes_off)
    # end

    it 'can confirm plane is no longer in the airport' do
      plane = double(:plane, flying?: false)
      allow(plane).to receive(:plane_takes_off)
      allow(weather).to receive(:stormy?) {false}
      subject.planes_in_airport << plane
      subject.take_off(plane)
      expect(subject.planes_in_airport).not_to include plane
    end

    it 'cannot make a plane takeoff if it is flying' do
      plane = double(:plane, flying?: true)
      expect{subject.take_off(plane)}.to raise_error("Plane is in the air")
    end

    it 'planes can only takeoff from airports they are in' do
      plane = double(:plane, flying?: false)
      allow(plane).to receive(:plane_takes_off)
      airport2 = Airport.new
      airport2.planes_in_airport << plane
      expect{subject.take_off(plane)}.to raise_error("Plane not in airport")
    end
  end

  context 'stormy weather' do
    before do
      allow(weather).to receive(:stormy?) {true}
    end

    it 'prevents takeoff when weather is stormy' do
      plane = double(:plane, flying?: false)
      allow(plane).to receive(:plane_takes_off)
      subject.planes_in_airport << plane
      expect{subject.take_off(plane)}.to raise_error("Too stormy to take off")
    end

    it 'prevents landing when weather is stormy' do
      plane = double(:plane, flying?: true)
      allow(plane).to receive(:plane_lands)
      expect{subject.land(plane)}.to raise_error("Too stormy to land")
    end
  end

end
