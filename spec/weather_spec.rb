require 'weather'

describe Weather do

  it 'provides the weather from a few different options' do
    weather_today = Weather.new([:sunny, :stormy, :sunny, :stormy, :sunny, :sunny, :sunny])
    expect(weather_today.weather).to eq(:stormy).or(eq(:sunny))
  end

  it "returns true if the weather is stormy" do
    weather_today = Weather.new([:sunny, :stormy, :sunny, :stormy, :sunny, :sunny, :sunny])
    allow(weather_today).to receive(:weather) { :sunny }
    expect(weather_today.isStormy?).to eq (false)
  end
end

