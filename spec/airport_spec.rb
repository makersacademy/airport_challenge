require "airport"

describe Airport do
  describe "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }
    it "fails when the airport is full" do
      allow(subject).to receive(:weather) { "clear" }
      20.times {subject.land(Plane.new)}
      expect {subject.land(Plane.new)}.to raise_error "The airport is full"
    end
  end

  describe "#takeoff" do
    it "should tell planes to take off" do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      expect(airport.takeoff).to eq "The plane has taken off"
    end
  end

  describe "#initialize" do
    it "should have a default capacity of 20" do
      airport = Airport.new
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it "should change capacity with an argument" do
      airport =  Airport.new(30)
      expect(airport.capacity).to eq 30
    end
  end
  describe "#weather" do
    it "prevents takeoff when the weather is stormy" do
      allow(subject).to receive(:weather) { "stormy" }
      expect {subject.takeoff}.to raise_error "Takeoff is prevented due to stormy conditions"
    end
    it "prevents landing when the weather is stormy" do
      allow(subject).to receive(:weather) { "stormy" }
      expect {subject.land(Plane.new)}.to raise_error "Landing is prevented due to stormy conditions"
    end
  end
end