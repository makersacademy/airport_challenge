require "weather"

describe Weather do 

  describe "#stormy?" do
    it "should have a random weather generator to determine if stormy" do 
      expect(subject).to respond_to(:stormy?)
    end

    it "should be equal to true or false" do 
      expect(subject.stormy?).to eq(true).or(eq(nil))
    end
  end
end
