require_relative "../lib/plane"

describe Plane do 

  let(:airport)	{ double("airport") }
  
  describe "#land" do
   
    it "should respond to land in an airport" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "airport's hanger should contain landed plane" do
      allow(airport).to receive(:land).with(subject).and_return(subject)
      expect(subject.land(airport)).to eq(subject)
    end
    
  end

end
