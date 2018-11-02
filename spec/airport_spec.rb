require 'airport'

describe Airport do
  let(:plane) { double("plane") }

  context "#land" do
    it "is able to land a plane at the airport" do
      subject.stormy_weather = false
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end

    it "prevents landing if weather is stormy" do
      subject.stormy_weather = true
      expect { subject.land(plane) }.to raise_error "Planes can't land, weather is stormy"
    end

    it "prevents landing if the airport is full" do
      expect { (subject.capacity + 1).times { subject.land(plane) } }.to raise_error "Planes can't land, the airport is full"
    end

  end

  context "#take_off" do
    it "allows a plane to take off from the airport" do
      subject.stormy_weather = false
      subject.take_off(plane)
      expect(subject.planes).to_not include(plane)
    end

    it "prevents take off if weather is stormy" do
      subject.stormy_weather = true
      expect { subject.take_off(plane) }.to raise_error "Weather is stormy"
    end
  end
end
