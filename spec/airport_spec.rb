require_relative '../lib/airport'

describe Airport do
  subject(:airport) { Airport.new }

  it 'has a default capacity' do
    expect(airport.capacity).to eq(100)
  end

  it 'is able to have planes' do
    expect(airport.planes).to be_an_instance_of(Array)
  end

  it 'can be at capacity' do
    expect(airport.at_capacity?).to be(true).or be(false)
  end

  describe '#weather_is_bad?' do
    it 'returns true if there is a storm' do
      weather = Weather.new
      allow(weather).to receive(:random_weather) {'stormy'}
      expect(airport.weather_is_bad?(weather)).to eq(true)
    end
  end
end
