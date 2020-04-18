require 'weather'

describe Weather do

  it 'responds to stormy?' do
    expect(subject).to respond_to(:stormy?)
  end

  it 'returns true or false' do
    weather = Weather.new
    expect(weather.stormy?).to eq(true).or eq(false)
  end

  it 'returns true when forced' do
    weather = Weather.new
    allow(weather).to receive(:stormy?) { true }
    expect(weather.stormy?).to eq(true)
  end

  it 'returns false when forced' do
    weather = Weather.new
    allow(weather).to receive(:storm?) { false }
    expect(weather.stormy?).to eq(false)
  end

end
