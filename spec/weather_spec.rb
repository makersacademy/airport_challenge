require 'weather'

describe Weather do
  it 'responds to the method #forecast' do
    expect(subject).to respond_to(:forecast)
  end
end

describe "#forecast" do
  it 'generates a stormy forecast' do
    weather = Weather.new
    allow(weather).to receive(:rand).and_return(2)
    expect(weather.forecast).to eq(false)
  end

  it 'generates a clear forecast' do
    weather = Weather.new
    allow(weather).to receive(:rand).and_return(1)
    expect(weather.forecast).to eq(true)
  end
end
