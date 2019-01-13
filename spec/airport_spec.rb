require "airport"

describe Airport do

  let(:airborn_plane) { double(:flying => true, :grounded => false )}
  let(:grounded_plane) { double(:flying => false, :airborn => true) }
  let(:test_plane) { double(:flying => nil, :airborn => nil, :grounded => nil) }

  describe "#land" do
    it { is_expected.to respond_to(:land) }

    it "should have a plane land" do
      allow(subject).to receive(:random_generator) { 1 }
      expect(subject.land(airborn_plane)) == airborn_plane
    end

    it "should not land if weather is stormy" do
      allow(subject).to receive(:random_generator) { 2 }
      expect { subject.land(airborn_plane) }.to raise_error "BadWeatherError"
    end

    it "should not be able to land unless it is flying" do
      allow(subject).to receive(:random_generator) { 1 }
      expect { subject.land(grounded_plane) }.to raise_error "PlaneNotAirbornError"
    end

  end

  describe "#take_off" do

    it { is_expected.to respond_to(:take_off) }

    it "should have a plane take off" do
      allow(subject).to receive(:random_generator) { 1 }
      subject.land(test_plane)
      expect(subject.take_off(test_plane)).to eq("#{test_plane} has safely taken off")
    end

    it "should not take off if weather is stormy" do
      allow(subject).to receive(:random_generator) { 1 }
      subject.land(test_plane)
      allow(subject).to receive(:random_generator) { 2 }
      expect { subject.take_off(test_plane) }.to raise_error "BadWeatherError"
    end

    it "should not be able to take off if the plane is not in the airport" do
      expect { subject.take_off(grounded_plane) }.to raise_error "PlaneNotInAirportError"
    end

    it "should not be possible to take off when plane already flying" do
      allow(subject).to receive(:random_generator) { 1 }
      expect { subject.take_off(airborn_plane) }.to raise_error "PlaneAirbornError"
    end

  end

  describe "#random_generator" do
    it "should generate a random number between 1 and 5" do
      srand(11)
      expect(subject.random_generator) == "stormy"
    end
  end

  describe "#weather" do
    it "has default weather sunny" do
      expect(subject.weather) == Airport::DEFAULT_WEATHER
    end

    it "changes the weather to stormy when a the number 2 is generated" do
      allow(subject).to receive(:random_generator) { 2 }
      expect(subject.weather_check).to eq("stormy")
    end
  end

  describe "#capacity" do
    it "has default capacity of 5 planes" do
      expect(subject.capacity) == Airport::DEFAULT_CAPACITY
    end

    it "cannot have more planes than capacity" do
      allow(subject).to receive(:random_generator) { 1 }
      subject.capacity.times { subject.land(airborn_plane) }
      expect { subject.land(airborn_plane) }.to raise_error "AirportFullError"
    end
  end

end
