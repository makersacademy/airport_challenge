require "weather"

describe "Weather" do
  before(:each) do
    @test_weather = Weather.new()
  end

  it "it should have a boolean stormy property" do
    expect([TrueClass, FalseClass].include?(@test_weather.stormy.class)).to eq(true)
  end
  
  it "should initialise a weather instance" do
    expect(@test_weather.class).to eq(Weather)
  end
end