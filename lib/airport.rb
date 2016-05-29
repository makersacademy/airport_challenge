require_relative 'weather'

class Airport

  attr_reader :capacity
  attr_reader :planes

  def initialize
    @capacity = 5
    @planes = []
    @weather = Weather.new
  end

  # #set_capacity allows maximum plane capacity of the airport
  # to be set.
  def set_capacity(new_capacity)
    return "Capacity cannot be negative" if new_capacity < 0
    @capacity = new_capacity
  end

  # #accept_plane checks whether the airport will receive a plane
  # that intends to land.  It may not accept the plane if it is already
  # at capacity, or the weather is stormy.
  def accept_landing(plane, weather = @weather)
    return "Airport already at capacity" if @planes.length >= @capacity
    return "Weather too stormy" if weather.get_weather == 'Stormy'
    @planes << plane
    true
  end

  def allow_take_off(plane, weather = @weather)
    curr_weather = weather.get_weather
    return "Weather too stormy" if weather.get_weather == 'Stormy'
    @planes.delete(plane)
    true
  end

end

airport = Airport.new
# airport.set_capacity(-5)