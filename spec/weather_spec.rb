require "weather"

describe Weather do

  describe "#stormy?" do
    it "should return a boolean" do
      weather = Weather.new
      expect([true, false]).to include weather.stormy?
    end
  end

end
