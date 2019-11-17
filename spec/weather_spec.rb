require "weather"

describe Weather do 

  describe "#stormy?" do
    it "should have a random weather generator to determine if stormy" do 
      expect(subject).to respond_to(:stormy?)
    end
  end
end
