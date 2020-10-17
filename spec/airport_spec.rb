require "airport"

describe Airport do

  let(:plane) { double :plane }

  describe "#takeoff" do

    it "raises an error if the plane is already in air" do
      lhr = Airport.new("lhr")
      allow(plane).to receive(:location) { "in air" }
      allow(lhr).to receive(:stormy?).and_return(false)
      expect { lhr.takeoff(plane) }.to raise_error("Plane is already in air")
    end

    it "raises an error if the plane is not in the airport" do
      lhr = Airport.new("lhr")
      jfk = Airport.new("jfk")
      allow(plane).to receive(:location) { jfk }
      allow(lhr).to receive(:stormy?).and_return(false)
      expect { lhr.takeoff(plane) }.to raise_error("Plane is not in this airport")
    end

    it "raises an error if the weather is stormy" do
      lhr = Airport.new("lhr")
      allow(plane).to receive(:location) { lhr }
      allow(lhr).to receive(:stormy?).and_return(true)
      expect { lhr.takeoff(plane) }.to raise_error("Weather is stormy! Do not takeoff")
    end

    it "deletes the plane from the planes list" do
      lhr = Airport.new("lhr")
      allow(plane).to receive(:location) { lhr }
      allow(lhr).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:change_location).with("in air")
      lhr.takeoff(plane)
      expect(lhr.planes.include?(plane)).to eq false
    end

  end

  describe "#land" do
    it "raises an error if the plane is already in an airport" do
      lhr = Airport.new("lhr")
      allow(plane).to receive(:location) { lhr }
      allow(lhr).to receive(:stormy?).and_return(false)
      expect { lhr.land(plane) }.to raise_error("Plane is already in lhr")
    end

    it "raises an error if there is no space in the Airport" do
      lhr = Airport.new("lhr")
      allow(plane).to receive(:location) { "in air" }
      allow(lhr).to receive(:stormy?).and_return(false)
      allow(lhr).to receive(:full?).and_return(true)
      expect { lhr.land(plane) }.to raise_error("No space in airport! Do not land")
    end

    it "appends the plane to the planes list" do
      lhr = Airport.new("lhr")
      allow(plane).to receive(:location) { "in air" }
      allow(lhr).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:change_location).with(lhr)
      lhr.land(plane)
      expect(lhr.planes.include?(plane)).to eq true
    end

    it "raises an error if the weather is stormy" do
      lhr = Airport.new("lhr")
      allow(plane).to receive(:location) { "in air" }
      allow(lhr).to receive(:stormy?).and_return(true)
      expect { lhr.land(plane) }.to raise_error("Weather is stormy! Do not land")
    end

  end

end
