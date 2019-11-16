require "weather"

describe Weather do

  describe "#is_stormy?" do
    it "should return true or false" do
      weather = Weather.new
      expect([true, false]).to include weather.is_stormy?
    end
  end

end
