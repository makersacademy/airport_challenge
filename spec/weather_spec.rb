require "weather"

describe Weather do
  context "#weather_condition" do
    it "should be stormy or sunny." do
      expect(["stormy", "sunny"]).to include(subject.weather_condition)
    end
  end
  
end
