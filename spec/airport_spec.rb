require_relative "../lib/airport.rb"

describe Airport do 
   
  let(:plane) { double("plane") }
  
  describe "#land" do
   
    it { is_expected.to respond_to(:land).with(1).argument }

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

end
