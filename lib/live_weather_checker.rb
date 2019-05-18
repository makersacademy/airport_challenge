require 'httparty'

class LiveWeatherChecker
  def stormy?
    response = call_weather_api
    puts response

    return true
  end

  private

  def call_weather_api
    response = HTTParty.get('https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=4c1a3536febad70a64e3f920a03f372a')
    response.parsed_response
    response
  end
end


# stormy if greater that 40 mph and raining