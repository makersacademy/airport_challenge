require 'jet'

describe Jet do
  airport = Gatwick.new

  it "should respond to #land" do
    expect(subject).to respond_to(:land)
  end

    describe "#land" do
      it "should accept one argument" do
        expect(subject).to respond_to(:land).with(1).argument
      end
    
      it "should allow a plane to land at an airport" do
        expect(subject.land(airport)).to eq(airport.hangar << subject)
      end

      it "should raise an error if the airport is full" do
        plane = Jet.new
        airport = Gatwick.new
        allow(plane).to receive(:stormy).and_return false
        Gatwick::DEFAULT_CAPACITY.times{plane.land(airport)}
        expect{plane.land(airport)}.to raise_error "You can't land here. The airport is full!"
      end

      it "should raise an error if the weather is stormy" do    
        allow(subject).to receive(:stormy).and_return true
        expect{subject.land(airport)}.to raise_error "The weather is bad! You can't land!"
      end
    end

  it "should respond to #take_off" do
    expect(subject).to respond_to(:take_off)
  end

    describe "#take_off" do
      it "should accept one argument" do
        expect(subject).to respond_to(:take_off).with(1).argument
      end    
      
      it "should raise an error if the weather is stormy" do    
        allow(subject).to receive(:stormy).and_return true
        expect{subject.take_off(airport)}.to raise_error "The weather is bad! Stay on the ground!"
      end
    end

  it "should respond to #left?" do
    expect(subject).to respond_to(:left?)
  end

  describe "#left?" do
    it "should accept one argument" do
      expect(subject).to respond_to(:left?).with(1).argument
    end

    it "should confirm that is no longer in the airport" do
      plane = Jet.new
      airport = Gatwick.new
      allow(plane).to receive(:stormy).and_return false
      plane.land(airport)
      plane.take_off(airport)
      expect(plane.left?(airport)).to be true 
    end
  end
end

describe Gatwick do
  describe "initialization" do
    it "should provide the airport a default capacity" do
      expect(subject.capacity).to eq(Gatwick::DEFAULT_CAPACITY)
    end

    it "should be able to vary the capacity of planes it can take" do
      airport = Gatwick.new(20)
      plane = Jet.new
      allow(plane).to receive(:stormy).and_return false
      20.times {plane.land(airport)}
      expect{plane.land(airport)}.to raise_error "You can't land here. The airport is full!"
    end
  end
end