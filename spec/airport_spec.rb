require "airport"

describe Airport do

  it "Chech if airport is a class" do
    expect(subject).to be_instance_of(Airport)
  end

  it "The Airport can extend it's capacity on request" do 
    airport = Airport.new
    airport.capacity = 50
    expect(airport.capacity).to eq 50
  end

  describe "#hangar" do 
    it "Airport can store plains" do 
      expect(subject.hangar).to eq []
    end
  end

  describe "#forecast" do
    it "Checks the forecast and return true in good weather" do
      airport = Airport.new
      allow(airport).to receive(:rand).and_return(1)
      expect(airport.forecast?).to eq true
    end
  end 

  describe "#land" do 
    it "lands a plain" do 
      plane = double("plane")
      subject.land(plane)
      expect(subject.hangar).to eq [plane] 
    end

    it "Raise error when the airport capacity is full" do 
      10.times { subject.land(double("plane")) }
      expect { subject.land(double("Big Plane")) }.to raise_error "Airport is full"
    end

  end 

  describe "#take_off" do 
    it "Tells the plain to take off" do
      airport = Airport.new
      allow(airport).to receive(:rand).and_return(1)
      plane = double("plane")
      airport.land(plane)
      airport.take_off(plane)
      expect(subject.hangar).to eq []
    end

    it "Raice error if weather is stormy" do 
      plane = double("plane")
      allow(subject).to receive(:rand).and_return(0)
      subject.land(plane)
      expect { subject.take_off(plane) }.to raise_error "Bad weather! Taking off is forbidden!"
    end

  end

end
