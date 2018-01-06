require_relative "../lib/airport.rb"

describe Airport do 
   
  describe "#land" do
   
   	it "should respond to land in an airport" do
      expect(subject).to respond_to(:land).with(1).argument
    end
    
  end

end
