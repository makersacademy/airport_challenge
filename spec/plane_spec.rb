require 'plane'

describe Plane do
  airport = Airport.new

  it "should respond to #land" do
    expect(subject).to respond_to(:land)
  end

  it "should respond to #take_off" do
    expect(subject).to respond_to(:take_off)
  end

  it "should respond to #departed?" do
    expect(subject).to respond_to(:departed?)
  end

  describe "#land" do
    it "should accept one argument" do
      expect(subject).to respond_to(:land).with(1).argument
    end
  
    it "should allow a plane to land at an airport" do
      allow(subject).to receive(:stormy).and_return false
      expect(subject.land(airport)).to eq(airport.hangar << subject)
    end

    it "should raise an error if the airport is full" do
      plane = Plane.new
      airport = Airport.new
      allow(plane).to receive(:stormy).and_return false
      allow(airport).to receive(:full).and_return true
      expect { plane.land(airport) }.to raise_error "You can't land here. The airport is full!"
    end

    it "should raise an error if the weather is stormy" do    
      allow(subject).to receive(:stormy).and_return true
      expect { subject.land(airport) }.to raise_error "The weather is bad! You can't land!"
    end

    it "should raise and error if plane is landed elsewhere" do
      plane = Plane.new
      airport = Airport.new
      allow(plane).to receive(:stormy).and_return false
      allow(plane).to receive(:ground_location).and_return :ground
      expect { plane.land(airport) }.to raise_error "This plane is already on the ground!"
    end
  end

  describe "#take_off" do
    it "should accept one argument" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end    
    
    it "should raise an error if the weather is stormy" do    
      allow(subject).to receive(:stormy).and_return true
      expect { subject.take_off(airport) }.to raise_error "The weather is bad! Stay on the ground!"
    end

    it "should raise an error if plane not in the airport" do
      plane = Plane.new
      airport = Airport.new
      airport.hangar.delete(plane)
      allow(plane).to receive(:stormy).and_return false
      expect { plane.take_off(airport) }.to raise_error "This plane is not in this airport!"
    end
  end

  describe "#departed?" do
    it "should accept one argument" do
      expect(subject).to respond_to(:departed?).with(1).argument
    end 

    it "should confirm that is no longer in the airport" do
      plane = Plane.new
      airport = Airport.new
      allow(plane).to receive(:stormy).and_return false
      plane.land(airport)
      plane.take_off(airport)
      expect(plane.departed?(airport)).to be true 
    end
  end
end

describe Airport do
  describe "initialization" do
    it "should provide the airport a default capacity" do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end

    it "should be able to vary the capacity of planes it can take" do
      airport = Airport.new(20)
      plane = Plane.new
      allow(plane).to receive(:stormy).and_return false
      allow(airport).to receive(:full).and_return true
      expect { plane.land(airport) }.to raise_error "You can't land here. The airport is full!"
    end
  end
end
