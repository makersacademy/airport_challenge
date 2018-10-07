require "./lib/weather.rb"

describe Weather do
  weather = Weather.new
  it "reports current conditions" do
    expect(weather.conditions).to eq("Clear").or eq("Storm")
  end
end
