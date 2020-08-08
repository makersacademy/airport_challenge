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
      plane = double("plane", :status => "air")
      allow(subject).to receive(:rand).and_return(1)
      subject.land(plane)
      expect(subject.hangar).to eq [plane] 
    end

    it "Raise error when the airport capacity is full" do 
      allow(subject).to receive(:rand).and_return(1)
      10.times { subject.land(double("plane", :status => "air")) }
      expect { subject.land(double("Big Plane", :status => "air")) }.to raise_error "Airport is full"
    end

    it "Raise error when plane try to land in stormy weather" do 
      plane = double("plane", :status => "air")
      allow(subject).to receive(:rand).and_return(0)
      expect { subject.land(plane) }.to raise_error "Bad weather! Landing is forbidden at this airport at the moment!" 
    end

    it "Raise error if the plain is not in the air" do 
      plane = double("Landend Plane", :status => "ground")
      allow(subject).to receive(:rand).and_return(1)
      expect { subject.land(plane) }.to raise_error "This plane isn't flying"
    end

  end 

  describe "#take_off" do 
    it "Tells the plain to take off and confirm it's not at the airport anymore" do
      airport = Airport.new
      allow(airport).to receive(:rand).and_return(1)
      plane = double("plane", :status => "ground")
      airport.hangar << plane
      airport.take_off(plane)
      expect(subject.hangar).to eq []
    end

    it "Raice error if weather is stormy" do 
      allow(subject).to receive(:rand).and_return(0)
      expect { subject.take_off("plane") }.to raise_error "Bad weather! Taking off is forbidden!"
    end

    it "Raise error if the plane is already in the air" do 
      allow(subject).to receive(:rand).and_return(1)
      plane = double("Flying plane", :status => "air")
      expect { subject.take_off(plane) }.to raise_error "This plane is already in the air"
    end

    it "Raise error if you try to take off plane belonging to other airport" do 
      allow(subject).to receive(:rand).and_return(1)
      plane = double("Flying plane", :status => "ground")
      expect { subject.take_off(plane) }.to raise_error "This plane is NOT at this airport"
    end

  end

end
