require 'weather'
class AirportWeather
  include Weather
end

describe AirportWeather do

  it 'can produce a random number between 1 & 100' do
    expect(subject.weather_rand).to be_between(0, 100)
  end
  it 'is sunny weather' do
    allow(subject).to receive(:storm?).and_return(false)
    expect(subject).not_to be_storm
  end
  it 'is #stormy weather' do
    allow(subject).to receive(:storm?).and_return(true)
    expect(subject).to be_storm
  end
  it { is_expected.to respond_to(:storm?) }
  it ' is expected to retun boolean value' do
    expect([true, false]).to include(subject.storm?)
  end
end
