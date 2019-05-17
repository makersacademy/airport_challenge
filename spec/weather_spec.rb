require_relative '../docs/weather.rb'

describe Weather do
  let(:weather) { Weather.new }
  let(:random_num) {
    ->(num) {
      obj = double()
      allow(obj).to receive(:rand_num) { num }
      obj.rand_num
    }
  }

  it '.initialize sets up array of weather outcomes' do
    expect(weather.weather_generator).to eq(["sunny", "sunny", "sunny", "sunny", "stormy"])
  end

  it '.rand_num outputs a number between 0 and 4' do
    expect(weather.rand_num).to be_between(0, 4).inclusive
  end

  it '.get_weather outputs sunny' do
    num = random_num[2]
    expect(weather.get_weather(num)).to eq("sunny")
  end

  it '.get_weather outputs stormy' do
    num = random_num[4]
    expect(weather.get_weather(num)).to eq("stormy")
  end

  it 'is .safe? to fly when weather is sunny' do
    weather_generated = weather.get_weather(2)
    expect(weather.safe?(weather_generated)).to eq(true)
  end

  it 'is not .safe? to fly when weather is stormy' do
    weather_generated = weather.get_weather(4)
    expect(weather.safe?(weather_generated)).to eq(false)
  end
end
