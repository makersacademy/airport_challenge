require 'weather'

describe Weather do
  it 'responds to the method #clear?' do
    expect(subject).to respond_to(:clear?)
  end
end

describe "#clear?" do
  it 'generates a stormy forecast' do
    weather = Weather.new
    allow(weather).to receive(:rand).and_return(4)
    expect(weather.clear?).to eq(false)
  end

  it 'generates a clear forecast' do
    weather = Weather.new
    allow(weather).to receive(:rand).and_return(1)
    expect(weather.clear?).to eq(true)
  end
end
