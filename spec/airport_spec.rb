require 'airport'

describe Airport do
  describe "#initialize" do
    it "starts with an empty hangar" do
      expect(subject.hangar).to eq []
    end

    it "has a default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "has a variable capacity" do
      airport = Airport.new(1)
      expect(airport.capacity).to eq 1
    end
  end

  describe '#full?' do
    it "raises an error if airport with default capacity is full" do
      allow(subject).to receive(:weather_setter) {5}
      Airport::DEFAULT_CAPACITY.times { Plane.new.land(subject) }
      expect { Plane.new.land(subject) }.to raise_error "This airport is full!"
    end

    it "raises an error if airport with variable capacity is full" do
      airport = Airport.new(2)
      allow(airport).to receive(:weather_setter) {5} 
      2.times { Plane.new.land(airport) }
      expect { Plane.new.land(airport) }.to raise_error "This airport is full!"
    end
  end

  describe "#stormy?" do
    it "returns the weather based on #weather_setter" do
      allow(subject).to receive(:weather_setter) {6}
      expect(subject.stormy?).to eq true
    end
  end
end