require_relative '../lib/airport.rb'
require_relative '../lib/weather.rb'

describe Weather do
  weather = Weather.new
  it { is_expected.to respond_to(:stormy?) }

  it 'return random weather' do
    expect(subject.random_weather).to eq(:stormy).or (eq(:sunny))
  end
  it 'return stormy if true' do
    expect(subject.stormy?).to eq(true).or(eq(false))
  end
end
