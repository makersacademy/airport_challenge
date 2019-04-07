require 'weather'

describe Weather do
  describe '#generate_weather' do
    it 'randomly generates number' do
      weather = Weather.new
      allow(weather).to receive(:generate_weather).and_return(1)
      expect(weather.generate_weather).to eq 1
    end
  end

  describe '#stormy?'
  it 'determines if the weather is stormy' do
    weather = Weather.new
    allow(weather).to receive(:generate_weather).and_return(6)
    expect(weather.stormy?).to eq true
  end


end
