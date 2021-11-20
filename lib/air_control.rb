require_relative 'airport'
require_relative 'plane'

module AirportControl
  # Allows both the pilots and airport staff to determine whether conditions are safe for travel 
  def check_weather
    @flight_status
    weather_options = ["Stormy", "Clear", "Clear", "Clear"]
    weather = weather_options[rand(0..3)]
  end

  landed_planes = [] #Stores planes which have landed. These planes are not allowed to take off again
end
