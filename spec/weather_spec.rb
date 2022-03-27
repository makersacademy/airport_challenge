require './lib/weather'

describe Weather do

  it "generates weather when it initiates" do
    weather = Weather.new
    expect(weather.is).to satisfy do |value|
      [:rainy, :sunny, :stormy].include?(value)
    end
  end

  it "reports whether weather is stormy" do
    weather = Weather.new
    if weather.is == :stormy
      expect(weather.stormy?).to be true
    else
      expect(weather.stormy?).to be false
    end
  end

end
