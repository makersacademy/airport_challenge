require 'weather'

describe Weather do
  it "checks the weather forcast on a stormy day" do
    weather = Weather.new
    weather.stub(:initialize) { 0 }
    expect(weather.check_weather).to eq("stormy")
  end
  it "checks the weather forcast on a fine day" do
    weather2 = Weather.new
    weather2.stub(:initialize) { 1 || 2 || 3 }
    expect(weather2.check_weather).to eq("sunny")
  end
end
