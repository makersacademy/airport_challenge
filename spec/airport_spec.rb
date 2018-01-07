require_relative "../lib/airport.rb"

describe Airport do 
   
  let(:plane) { double("plane") }
  
  describe "#land" do

    it "plane should give itself to hanger" do
      subject.land(plane)
      expect(subject.hanger).to include(plane)
    end
    
    it "can land two planes" do 
      subject.land(plane)
      subject.land(plane)
      expect(subject.hanger.length).to eq 2
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
    
  end

end
