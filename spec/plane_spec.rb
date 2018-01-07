require_relative "../lib/plane"

describe Plane do 

  let(:airport)	{ double("airport") }
  
  describe "#land" do
   
    it "a landed plane should raise error if you try to land it" do
      allow(airport).to receive(:land).with(subject).and_return(true)
      subject.land
      expect { subject.land }.to raise_error("Already Grounded") 
    end
    
  end

  describe "#take_off" do
 
    it "plane should be flying after take off" do
      allow(airport).to receive(:land).with(subject).and_return(true)
      subject.land
      subject.take_off
      expect(subject.flying).to eq(true) 
    end

    it "flying plane should raise error if you try to make it take off " do
      expect { subject.take_off } .to raise_error("Already Flying")
    end

  end
  
end
