require 'weather'

describe Weather do
  weather = Weather.new
  it 'is sunny' do
    weather.report = 'sun'
    expect(weather.sunny?).to eq true
  end

  it 'is stormy' do
    weather.report = 'storm'
    expect(weather.stormy?).to eq true
  end

  it 'responds to weather changes' do
    expect(weather).to respond_to :change
  end

  it 'is sunny when the sun is out' do
    allow(weather).to receive(:report).and_return('sun')
    weather.change
    expect(weather.report).to eq 'sun'
  end

  it 'is stormy when there is a storm' do
    allow(weather).to receive(:report).and_return('storm')
    weather.change
    expect(weather.report).to eq 'storm'
  end
  
end
