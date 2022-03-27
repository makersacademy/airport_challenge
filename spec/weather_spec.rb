require './lib/weather'

describe Weather do

  it "checks weather for rainy, sunny or stormy" do
    weather = Weather.new
    expect(weather.check).to satisfy do |value|
      [:rainy, :sunny, :stormy].include?(value)
    end
  end

  it "reports whether weather is stormy" do
    weather = Weather.new
    if weather.check == :stormy
      expect(weather.stormy?).to be true
    else
      expect(weather.stormy?).to be false
    end
  end

end
