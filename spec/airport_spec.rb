require "airport"

describe Airport do

  it "Chech if airport is a class" do
    expect(subject).to be_instance_of(Airport)
  end

  describe "#hangar" do 
    it "Airport can store plains" do 
      expect(subject.hangar).to eq []
    end
  end

  describe "#forecast" do
    it "Checks the forecast" do 
      expect(subject.forecast?).to eq true
    end
  end 

  describe "#land" do 
    it "lands a plain" do 
      plane = double("plane")
      subject.land(plane)
      expect(subject.hangar).to eq [plane] 
    end

    it "Raise error when the airport capacity is full" do 
      10.times {subject.land(double("plane")) }
      expect{subject.land(double("Big Plane"))}.to raise_error "Airport is full"
    end

  end 

  describe "#take_off" do 
    it "Tells the plain to take off" do
      plane = double("plane")
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.hangar).to eq []
    end
  end

end
