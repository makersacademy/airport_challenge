require_relative '../lib/airport'
describe Airport do
  context "landing planes" do
    it { is_expected.to respond_to(:land).with(1).argument }

    it "plane is in the airport once it has landed" do
      plane = Plane.new
      allow(subject).to receive(:weather) { "sunny" }
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end

    it "cannot land when the airport is full" do
      plane = Plane.new
      allow(subject).to receive(:weather) { "sunny" }
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error "The airport is full"
    end
  end

  context "planes taking off" do
    it { is_expected.to respond_to(:take_off) }

    it "plane is no longer in the airport after take off" do
      plane = Plane.new
      allow(subject).to receive(:weather) { "sunny" }
      subject.land(plane)
      subject.take_off
      expect(subject.planes).not_to include(plane)
    end
  end

  context "plane capacity" do
    it "has a default capacity" do
      airport = Airport.new
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "can take a new capacity" do
      airport = Airport.new(80)
      expect(airport.capacity).to eq 80
    end
  end

  context "weather is stormy" do
    it "cannot land if the weather is stormy" do
      plane = Plane.new
      allow(subject).to receive(:weather) { "stormy" }
      expect { subject.land(plane) }.to raise_error "It is too stormy to land"
    end

    it "cannot take off if the weather is stormy" do
      plane = Plane.new
      allow(subject).to receive(:weather) { "sunny" }
      subject.land(plane)
      allow(subject).to receive(:weather) { "stormy" }
      expect { subject.take_off }.to raise_error "It is too stormy to take off"
    end
  end

  context "checking the weather" do
    it "can generate a number" do
      expect(subject.generate_number).to be_between(0, 9)
    end
    
    it "can return sunny or stormy" do
      expect(subject.weather).to eq('stormy').or(eq('sunny'))
    end
    
    it "knows when it is stormy" do
      allow(subject).to receive(:weather) { 1 }.and_return "stormy"
    end

    it "knows when it is sunny" do
      allow(subject).to receive(:weather) { 3 }.and_return "sunny"
    end
  end
end
