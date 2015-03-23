require 'weather'
class AirportWeather
  include Weather
end

describe AirportWeather do
  let(:airport) { Airport.new }
  it 'can produce a random number between 1 & 100' do
    expect(subject.weather_rand).to be_between(1, 100)
  end
  it 'is sunny weather' do
    allow(airport).to receive(:storm?).and_return(false)
    expect(airport).not_to be_storm
  end
  it 'is #stormy weather' do
    allow(airport).to receive(:storm?).and_return(true)
    expect(airport).to be_storm
  end
end
