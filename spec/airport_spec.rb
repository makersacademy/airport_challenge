require 'airport'

describe Airport do
  describe '#full?' do
    it "raises an error if airport with default capacity is full" do
      allow(subject).to receive(:weather_check) {5}
      Airport::DEFAULT_CAPACITY.times { Plane.new.land(subject) }
      expect { Plane.new.land(subject) }.to raise_error "This airport is full!"
    end

    it "raises an error if airport with variable capacity is full" do
      airport = Airport.new(2)
      allow(airport).to receive(:weather_check) {5} 
      2.times { Plane.new.land(airport) }
      expect { Plane.new.land(airport) }.to raise_error "This airport is full!"
    end
  end

  describe "#stormy?" do
    it "raises updates the weather based on #weather_check" do
      allow(subject).to receive(:weather_check) {6}
      subject.stormy?
      expect(subject.storm).to eq true
    end
  end
end