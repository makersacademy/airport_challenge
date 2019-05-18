require 'live_weather_checker'

describe LiveWeatherChecker do
  it 'responds to stormy? with boolean' do
    my_live_weather_checker = LiveWeatherChecker.new
    expect(my_live_weather_checker).to respond_to(:stormy?)
  end

  it 'responds to stormy? with boolean' do
    my_live_weather_checker = LiveWeatherChecker.new
    is_it_stormy = my_live_weather_checker.stormy?

    expect([true, false].include? is_it_stormy).to be true
  end
end