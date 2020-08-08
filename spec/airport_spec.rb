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
      plane = double("plane", :status => true)
      allow(subject).to receive(:rand).and_return(1)
      subject.land(plane)
      expect(subject.hangar).to eq [plane] 
    end

    it "Raise error when the airport capacity is full" do 
      allow(subject).to receive(:rand).and_return(1)
      10.times { subject.land(double("plane", :status => true)) }
      expect { subject.land(double("Big Plane", :status => true)) }.to raise_error "Airport is full"
    end

    it "Raise error when plane try to land in stormy weather" do 
      plane = double("plane", :status => true)
      allow(subject).to receive(:rand).and_return(0)
      expect { subject.land(plane) }.to raise_error "Bad weather! Landing is forbidden at this airport at the moment!" 
    end

    it "Rice error if the plain is not in the air" do 
      plane = double("Landend Plane", :status => false)
      allow(subject).to receive(:rand).and_return(1)
      expect { subject.land(plane) }.to raise_error "This plane isn't flying"
    end
  end 

  describe "#take_off" do 
    it "Tells the plain to take off and confirm it's not at the airport anymore" do
      airport = Airport.new
      allow(airport).to receive(:rand).and_return(1)
      plane = double("plane", :status => true)
      airport.land(plane)
      airport.take_off(plane)
      expect(subject.hangar).to eq []
    end

    it "Raice error if weather is stormy" do 
      allow(subject).to receive(:rand).and_return(0)
      expect { subject.take_off("plane") }.to raise_error "Bad weather! Taking off is forbidden!"
    end

  end

end
