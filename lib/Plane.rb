require 'Passenger'
require 'Weather'

class Plane
  attr_reader :location

  def initialize(location)
    @location = location

  end

  def land_at(airport)
    if Weather.stormy? != true
      @location = airport
    else
      puts "The plane can not land in inclement weather. Try again later."
    end
  end

  def location?
    @location
  end

end
