require 'weather'

describe Weather do

  let(:dummy_class) {Class.new {include Weather}}
  subject(:weather) {dummy_class.new}

  describe 'stormy?' do

  it 'can return true' do
    @counter = 0
    loop do
      @bad_weather = weather.stormy?
      break if @bad_weather
      @counter += 1
      break if @counter >= 10_000
    end
    expect(@bad_weather).to be(true)
  end

  it 'can return false' do
    @counter = 0
    loop do
      @bad_weather = weather.stormy?
      break unless @bad_weather
      @counter += 1
      break if @counter >= 10_000
    end
    expect(@bad_weather).to be(false)
  end

  end
end
