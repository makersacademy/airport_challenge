require 'Passenger'
require 'Weather'

class Plane
  attr_reader :location

  def initialize
    @location = "In hanger"

  end

  def land_at(airport)
    current_weather = Weather.new

    if current_weather.stormy? != true
      @location = airport
    else
      puts "The plane can not land in inclement weather. Please try landing again later."
    end
  end

  def location?
    @location
  end

end
