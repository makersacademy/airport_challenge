require 'weather_gen'

describe WeatherGenerator do
  subject(:weather) { described_class.new }

  it "it should have a boolean stormy property" do
    expect([TrueClass, FalseClass].include?(weather.forecast_stormy?.class)).to eq(true)
  end
  
  it "should initialise a weather instance" do
    expect(weather.class).to eq(WeatherGenerator)
  end
end
