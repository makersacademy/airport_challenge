require_relative "../lib/plane"

describe Plane do 

  let(:airport)	{ double("airport") }
  
  describe "#land" do
   
    it "should respond to land in an airport" do
      expect(subject).to respond_to(:land).with(1).argument
    end
    
  end

end
