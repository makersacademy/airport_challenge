require_relative "../lib/plane"

describe Plane do 

  let(:airport)	{ double("airport") }
  
  describe "#land" do
   
    it { is_expected.to respond_to(:land).with(1).argument }

    it "plane should give itself to hanger" do
      allow(airport).to receive(:land).with(subject).and_return(true)
      expect(subject.land(airport)).to be true
    end

    it "a landed plane should raise error if you try to land it" do
      allow(airport).to receive(:land)
      subject.land(airport)
      expect { subject.land(airport) } .to raise_error("Already Grounded") 
    end
    
  end

  describe "#take_off" do
 
    it "plane should be flying after take off" do
      allow(airport).to receive(:land).with(subject)
      subject.land(airport)	
      subject.take_off
      expect(subject.flying).to eq(true) 
    end

    it "flying plane should raise error if you try to make it take off " do
      allow(airport).to receive(:land).with(subject)
      subject.land(airport)	
      subject.take_off
      expect { subject.take_off } .to raise_error("Already Flying")
    end

  end
  
end
