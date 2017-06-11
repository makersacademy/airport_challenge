require "weather_generator.rb"

describe Weather do
  it "randomly generates weather" do
    forecast = Weather.new
    expect(["sunny", "stormy"]).to include forecast.generator
  end
end
