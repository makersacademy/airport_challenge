require 'random_weather_checker'

describe RandomWeatherChecker do
  it 'can instantiate' do
    my_weather_checker = RandomWeatherChecker.new

    expect(my_weather_checker).to be_kind_of(RandomWeatherChecker)
  end
end