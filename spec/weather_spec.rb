require "weather"

describe Weather do
  weather = Weather.new
  it "Bad weather conditions" do
    20.times do
      expect(weather.storm).to be(true).or be(false)
    end
  end
  
end
