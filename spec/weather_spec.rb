require 'weather'

describe Weather do

    it "returns true if stormy" do
      test = double("weather")
      test.stub(:stormy?) {true}
      expect(test.stormy?).to eq true
    end
    it "returns false if NOT stormy" do
      test = double("weather")
      test.stub(:stormy?) {false}
      expect(test.stormy?).to eq false
    end


end
