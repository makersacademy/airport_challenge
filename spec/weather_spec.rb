require './lib/weather.rb'

describe Weather do

  weather = Weather.new

  it 'should return either true or false' do
    expect(weather.stormy?).to be(true).or be(false)
  end

  it 'should return true if I tell it to' do
    allow(weather).to receive(:stormy?) { true }
    expect(weather.stormy?).to eq(true)
  end 

  it 'should return false if I tell it to' do
    allow(weather).to receive(:stormy?) { false }
    expect(weather.stormy?).to eq(false)
  end

end