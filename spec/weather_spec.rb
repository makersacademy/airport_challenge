require_relative '../lib/weather'

describe Weather do
  subject(:weather) { Weather.new }

  it 'can return stormy when weather is chosen randomly' do
    allow(weather).to receive(:rand).with(1..30) {8}
    expect(weather.random_weather).to eq('stormy')
  end

  it 'can return sunny when weather is chosen randomly' do
    allow(weather).to receive(:rand).with(1..30) {15}
    expect(weather.random_weather).to eq('sunny')
  end
end
