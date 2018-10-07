require 'weather_generator'

describe WeatherGenerator do

  let(:random) { double :random }

  it "should be stormy when random number is <= 3" do
    weather_generator = WeatherGenerator.new(random)
    allow(random).to receive(:rand) { 2 }
    expect(weather_generator.generate_weather).to eq "stormy"
  end

  it "should be clear when random number is > 3" do
    weather_generator = WeatherGenerator.new(random)
    allow(random).to receive(:rand) { 4 }
    expect(weather_generator.generate_weather).to eq "clear"
  end

  it "should still be clear when random number is > 3" do
    weather_generator = WeatherGenerator.new(random)
    allow(random).to receive(:rand) { 8 }
    expect(weather_generator.generate_weather).to eq "clear"
  end
end
