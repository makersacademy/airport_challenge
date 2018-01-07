require_relative "../lib/airport.rb"

describe Airport do 
   
  let(:plane) { double("plane") }
  
  describe "#land" do

    it "a landed plane should be in hanger" do
      subject.land(plane)
      expect(subject.hanger).to include(plane)
    end

    it "won't land an already landed plane" do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error("Already Grounded")
    end

    it "it won't let the plane land if weather is stormy" do 
      expect { subject.land(plane, "stormy") }.to raise_error("Weather too bad")
    end

    it "it won't let an plane land beyond if airport is at default capacity" do 
      Airport::DEFAULT_CAPACITY.times { subject.land(double("plane")) }
      expect { subject.land(plane) }.to raise_error("Airport full")
    end

    it "you can change the capacity to 30" do 
      airport = Airport.new(30)
      expect(airport.capacity).to eq 30 
    end

    it "you can change the capacity to 40 and it will hold 40 planes" do 
      airport = Airport.new(40)
      40.times { airport.land(double("plane")) }
      expect(airport.hanger.length).to eq 40
    end
    
  end

  describe "#take_off" do

    it "a plane that takes off should be removed from hanger" do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.hanger).to eq []
    end

    it "a plane can only take off, if its in the hanger" do
      expect { subject.take_off(plane) }.to raise_error("No such plane in hanger")
    end
    
    it "should recieve confirmation a plane has taken off" do
      subject.land(plane)
      expect(subject.take_off(plane)).to eq("#{plane} has taken off")
    end
    
    it "it won't let the plane take_off if weather is stormy" do 
      subject.land(plane)
      expect { subject.take_off(plane, "stormy") }.to raise_error("Weather too bad")
    end

  end
end
