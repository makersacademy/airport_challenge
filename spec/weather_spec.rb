require_relative '../docs/weather.rb'

describe Weather do
  let(:weather) { Weather.new }

  it '.initialize sets up array of weather outcomes' do
    expect(weather.weather_generator).to eq(["sunny", "sunny", "sunny", "sunny", "stormy"])
  end

  it 'responds to .rand_num' do
    expect(weather).to respond_to(:rand_num)
  end

  it '.rand_num outputs a number between 0 and 4' do
    expect(weather.rand_num).to be_between(0, 4).inclusive
  end

  it 'responds to get_weather' do
    expect(weather).to respond_to(:get_weather)
  end

  it '.get_weather outputs sunny' do
    obj = double()
    allow(obj).to receive(:rand_num) { 2 }
    num = obj.rand_num
    expect(weather.get_weather(num)).to eq("sunny")
  end

  it '.get_weather outputs stormy' do
    obj = double()
    allow(obj).to receive(:rand_num) { 4 }
    num = obj.rand_num
    expect(weather.get_weather(num)).to eq("stormy")
  end
end
