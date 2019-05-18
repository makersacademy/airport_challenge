require 'random_weather_checker'

describe RandomWeatherChecker do
  it 'can instantiate' do
    my_weather_checker = RandomWeatherChecker.new

    expect(my_weather_checker).to be_kind_of(RandomWeatherChecker)
  end

  describe '#is_stormy?' do
    it 'can respond to being asked if it is stormy' do
      my_weather_checker = RandomWeatherChecker.new

      expect(my_weather_checker).to respond_to(:is_stormy?)
    end
  end
end