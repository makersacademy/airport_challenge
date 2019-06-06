require 'weather'

describe Weather do
  it "generates weather" do
    weather = Weather.new
    weather.generate_weather
    # allow(weather).to receive(:rand).and_return(1)
    # expect(weather.generate_weather).to eq("stormy")
  end
end
