require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

describe Weather do
  it "returns a string" do
    weather = Weather.new
    expect(weather.report).to be_a String
  end

  it "reporting stormy weather status" do
    weather = Weather.new
    allow(weather).to receive(:report) { "stormy" }
    expect(weather.report).to eq "stormy"
  end

  it "reporting sunny weather status" do
    weather = Weather.new
    allow(weather).to receive(:report) { "sunny" }
    expect(weather.report).to eq "sunny"
  end

end
