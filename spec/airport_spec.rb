require "airport"

describe Airport do

  describe "#takeoff" do

    it "raises an error if the plane is already in air" do
      lhr = Airport.new
      plane = Plane.new
      plane.change_location("in air")
      allow(lhr).to receive(:stormy?).and_return(false)
      expect { lhr.takeoff(plane) }.to raise_error("Plane is already in air")
    end

    it "raises an error if the weather is stormy" do
      lhr = Airport.new
      plane = Plane.new
      allow(lhr).to receive(:stormy?).and_return(true)
      expect { lhr.takeoff(plane) }.to raise_error("Weather is stormy! Do not takeoff")
    end

    it "changes the location of the plane to in air" do
      plane = Plane.new
      lhr = Airport.new
      allow(lhr).to receive(:stormy?).and_return(false)
      lhr.takeoff(plane)
      expect(plane.location).to eq "in air"
    end

    it "deletes the plane from the planes list" do
      plane = Plane.new
      lhr = Airport.new
      allow(lhr).to receive(:stormy?).and_return(false)
      lhr.takeoff(plane)
      expect(lhr.planes.include?(plane)).to eq false
    end

  end

  describe "#land" do
    it "raises an error if the plane is already in an airport" do
      plane = Plane.new
      lhr = Airport.new
      allow(lhr).to receive(:stormy?).and_return(false)
      lhr.land(plane)
      expect{ lhr.land(plane) }.to raise_error("Plane is already in an Airport")
    end
    it "changes the location of the plane to itself" do
      plane = Plane.new
      lhr = Airport.new
      allow(lhr).to receive(:stormy?).and_return(false)
      lhr.land(plane)
      expect(plane.location).to eq lhr
    end

    it "appends the plane to the planes list" do
      plane = Plane.new
      lhr = Airport.new
      allow(lhr).to receive(:stormy?).and_return(false)
      lhr.land(plane)
      expect(lhr.planes.include?(plane)).to eq true
    end

    it "raises an error if the weather is stormy" do
      lhr = Airport.new
      plane = Plane.new
      allow(lhr).to receive(:stormy?).and_return(true)
      expect { lhr.land(plane) }.to raise_error("Weather is stormy! Do not land")
    end
  end

  describe "#full?" do
    it "returns true if an airport is full" do
      lhr = Airport.new(2)
      lhr.planes = ["plane", "plane"] # use doubling for plane class
      expect(lhr.full?).to eq true
    end
  end

  describe "#weather_generator" do
    it "randomly chooses a weather" do
      allow(subject).to receive(:rand).and_return(2)
      expect(subject.weather_generator).to eq "stormy"
    end
  end

  describe "#stormy?" do
    it "returns true if the weather is stormy" do
      allow(subject).to receive(:rand).and_return(2)
      expect(subject.stormy?).to eq true
    end
  end
end
