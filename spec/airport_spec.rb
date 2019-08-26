require 'airport'
require 'weather'



describe Airport do

  it { is_expected. to respond_to(:land).with(1).argument }
  it { is_expected. to respond_to(:take_off).with(1).argument }

  describe 'initialisation' do
    it "allows the default airport capacity to be set" do
      airport = Airport.new(50)
      allow(airport).to receive(:weather_unsafe?).and_return false
      50.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error "Airport full"
    end
  end

  describe '#land' do
    it "stores a plane when a plane lands at the airport" do
      allow(subject).to receive(:weather_unsafe?).and_return false
      plane = Plane.new
      expect(subject.land(plane)).to include plane
    end

    it "raises an error if a plane tries to land at a full airport" do
      allow(subject).to receive(:weather_unsafe?).and_return false
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error "Airport full"
    end

    it "raises an error if the same plane tries to land twice at an airport" do
      allow(subject).to receive(:weather_unsafe?).and_return false
      plane1 = Plane.new
      subject.land(plane1)
      expect { subject.land(plane1) }.to raise_error "This plane is already in the airport"
    end
  end

  describe '#take_off' do
    it "raises an error if a plane tries to take off from an empty airport" do
      allow(subject).to receive(:weather_unsafe?).and_return false
      expect { subject.take_off(Plane.new) }.to raise_error "This plane is not in the airport"
    end

    it "raises an error if a non existent plane tries to take off from an airport" do
      allow(subject).to receive(:weather_unsafe?).and_return false
      plane1 = Plane.new
      plane2 = Plane.new
      subject.land(plane1)
      expect { subject.take_off(plane2) }.to raise_error "This plane is not in the airport"
    end

    it "raises an error if the same plane tries to take off from the airport twice." do
      allow(subject).to receive(:weather_unsafe?).and_return false
      plane1 = Plane.new
      subject.land(plane1)
      subject.take_off(plane1)
      expect { subject.take_off(plane1) }.to raise_error "This plane is not in the airport"
    end
  end

  describe '#weather_unsafe?' do
    it "raises an error if a plane tries to land in stormy weather" do
      allow(subject).to receive(:weather_unsafe?).and_return true
      expect{ subject.land(Plane.new) }.to raise_error "The weather is too dangerous to land"
    end
  end

    it "raises an error if a plane tries to take off in stormy weather" do
      plane1 = Plane.new
      @planes = [plane1]
      allow(subject).to receive(:weather_unsafe?).and_return true
      expect{ subject.take_off(plane1) }.to raise_error "The weather is too dangerous to take off"
    end
end
