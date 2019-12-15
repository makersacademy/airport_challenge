require "airport"

describe Airport do

  describe "#initalize" do
    it "Initializes airports with a default capacity of 50" do
      heathrow = Airport.new("Heathrow")
      expect(heathrow.capacity).to eq(50)
    end
    it "It allows airports to be initialized with any capacity" do
      birmingham = Airport.new("Birmingham", 25)
      expect(birmingham.capacity).to eq(25)
    end
  end

  describe "#land" do
    it "Adds the plane to the list of planes at the airport" do
      plane = double("plane")
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end
  end

  describe "#take_off" do
    it "Removes the plane from the list of planes at the airport" do
      plane = double("plane")
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end
  end

  describe "#full?" do
    it "Returns true if airport is full" do
      plane = double("plane")
      subject.capacity.times {subject.land(plane)}
      expect(subject.full?).to be true
    end
    it "Returns false if airport is not full" do
      plane = double("plane")
      (subject.capacity - 1).times {subject.land(plane)}
      expect(subject.full?).to be false
    end
  end

  describe "#weather" do
    it "Returns weather at the airport" do
      weather_service = double("weather_servicer", :current_weather => "stormy")
      expect(subject.weather(weather_service)).to eq("stormy")
    end
  end

end
