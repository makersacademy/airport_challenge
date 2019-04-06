require 'weather'

describe Weather do
  it 'tells air control if sunny' do
    weather = Weather.new
    allow(weather).to receive(:rand).and_return(1)
    expect(weather.sunny_or_stormy).to eq 1
  end
  it 'tells air control if stormy' do
    weather = Weather.new
    allow(weather).to receive(:rand).and_return(2)
    expect(weather.sunny_or_stormy).to eq 2
  end
end
