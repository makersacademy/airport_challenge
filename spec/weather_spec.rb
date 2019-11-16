require "weather"

describe Weather do

  describe "#stormy?" do
    it "should return true or false" do
      weather = Weather.new
      expect([true, false]).to include weather.stormy?
    end
  end

end
