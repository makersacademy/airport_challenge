require 'weather'

describe Weather do

  it "returns either true or false when asked if weather is stormy" do
    expect(subject.stormy?).to satisfy { |result| result == true || result == false } 
  end

  it "should initialize with an instance variable" do
    expect(subject.weather_indicator).to_not be nil
  end

  it "should generate a storm randomly" do
    weathers = []
    1000.times { weathers << Weather.new.weather_indicator }
    
    expect(weathers).to include("Storm", "Clear")
  end

end
