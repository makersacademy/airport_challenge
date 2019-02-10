require './lib/weather.rb'

describe Weather do
  it 'should return stormy weather if random number generator returns 20' do
    weather = Weather.new
    allow(weather).to receive(:rand).and_return(20)

    expect(weather.stormy?).to eq(true)
  end
end
