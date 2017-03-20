require 'airport'

describe Airport do

  #lookup benefits of naming subjects explicitly
  let(:plane) {Plane.new}
  let(:weather) {Weather.new}


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
    it 'instructs the plane to land' do
      plane = double(:plane, flying?: true)
      allow(weather).to receive(:stormy?) {false}
      expect(subject).to receive(:land)
      subject.land(plane)
    end

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
      message = "Airport is full"
      expect{subject.land(plane)}.to raise_error message
    end

  end

  describe '#take_off' do
    # How to create plane double first??
    # before do
    #   allow(plane).to receive(:plane_takes_off)
    # end
    it 'instructs the plane to takeoff' do
      plane = double(:plane, flying?: false)
      allow(weather).to receive(:stormy?) {false}
      expect(subject).to receive(:take_off)
      subject.take_off(plane)
    end

    it 'does not have plane after it has taken off' do
      plane = double(:plane, flying?: false)
      allow(weather).to receive(:stormy?) {false}
      allow(plane).to receive(:plane_takes_off)
      subject.planes_in_airport << plane
      subject.take_off(plane)
      expect(subject.planes_in_airport).not_to include plane
    end

    it 'cannot make a plane takeoff if it is flying' do
      plane = double(:plane, flying?: true)
      message = "Plane is in the air"
      expect{subject.take_off(plane)}.to raise_error message
    end

    it 'planes can only takeoff from airports they are in' do
      plane = double(:plane, flying?: false)
      airport2 = Airport.new
      airport2.planes_in_airport << plane
      message = "Plane not in airport"
      expect{subject.take_off(plane)}.to raise_error message
    end
  end

  context 'stormy weather' do
    before do
      allow(weather).to receive(:stormy?) {true}
    end

    it 'prevents takeoff when weather is stormy' do
      plane = double(:plane, flying?: false)
      subject.planes_in_airport << plane
      message = "Too stormy to take off"
      expect{subject.take_off(plane)}.to raise_error message
    end

    it 'prevents landing when weather is stormy' do
      plane = double(:plane, flying?: true)
      message = "Too stormy to land"
      expect{subject.land(plane)}.to raise_error message
    end
  end

end
