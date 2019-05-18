require 'random_weather_checker'

describe RandomWeatherChecker do
  it 'can instantiate' do
    my_weather_checker = RandomWeatherChecker.new

    expect(my_weather_checker).to be_kind_of(RandomWeatherChecker)
  end

  describe '#is_stormy?' do
    it 'can respond to being asked if it is stormy' do
      my_weather_checker = RandomWeatherChecker.new

      expect(my_weather_checker).to respond_to(:stormy?)
    end

    it 'will return a boolean' do
      my_weather_checker = RandomWeatherChecker.new

      stormy_ = my_weather_checker.stormy?
      puts stormy_
      expect(stormy_).to be(true).or be(false)
    end
  end
end
