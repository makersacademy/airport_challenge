require 'airport'

describe Airport do
  plane = Plane.new

  it "should respond to #land" do
    expect(subject).to respond_to(:land)
  end

  describe "#land" do
    it "should accept one argument" do
      expect(subject).to respond_to(:land).with(1).argument
    end
  end

  it "should allow a plane to land at the airport" do
    expect(subject.land(plane)).to eq([plane])
  end

  it "should respond to #take_off" do
    expect(subject).to respond_to(:take_off)
  end

  describe "#take_off" do
    it "should accept one argument" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
    
    it "should raise an error if the weather is stormy" do    
      allow(subject).to receive(:weather).and_return(5)
      expect{subject.take_off(plane)}.to raise_error "The weather is bad! Stay on the ground!"
    end
  end
 
  it "should release a plane after take off" do
    subject.land(plane)
    allow(subject).to receive(:weather).and_return(0)
    expect(subject.take_off(plane)).to eq(plane)
  end

  describe "#airborne?" do
    it "should accept one argument" do
      expect(subject).to respond_to(:airborne?).with(1).argument
    end
  end

  it "should confirm that a plane is no longer in the airport" do
    allow(subject).to receive(:weather).and_return(0)
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.airborne?(plane)).to be true
  end

  describe "#land" do
    it "should raise an error if airport is full" do
      Airport::DEFAULT_CAPACITY.times{subject.land(Plane.new)}
      expect{subject.land(Plane.new)}.to raise_error "You can't land here. We're full!"
    end
  end

    describe "initialization" do
      it "should provide the airport a default capacity" do
        expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
      end

      it "should be able to vary the capacity of planes it can take" do
        airport = Airport.new(35)
        35.times {airport.land(Plane.new)}
        expect{airport.land(Plane.new)}.to raise_error "You can't land here. We're full!"
      end
    end
end 
