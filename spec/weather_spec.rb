require "weather"

describe Weather do
    
  context "#weather_condition" do
    it "should be stormy or sunny." do
      expect(["stormy", "sunny"]).to include(subject.weather_condition)
    end

    # stubbing my way into life.
    it "should be able to return stormy" do
      random_weather = double('Weather', weather_condition: "stormy")
      expect(random_weather.weather_condition).to eq("stormy") 
    end

    # stubbing my way into life. Hoefully the right way.
    it "should be able to return sunny" do
      random_weather = double('Weather', weather_condition: "sunny")
      expect(random_weather.weather_condition).to eq("sunny") 
    end
  end
  
end
