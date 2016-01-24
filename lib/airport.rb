require 'air_traffic_controller'

class Airport
  attr_reader :name, :capacity, :planes_at_airport, :weather
  DEFAULT_CAPACITY = 20

  def initialize (name='default', capacity=DEFAULT_CAPACITY)
    @name = name
    @capacity = capacity
    @planes_at_airport = []
  end

  #private

  def land_plane(plane)
    @planes_at_airport << plane
  end

  def take_off_plane(plane)
    @planes_at_airport.delete(plane)
  end

  def set_weather(weather="Storm")
    @weather = weather
  end

end
