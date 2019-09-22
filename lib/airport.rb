require_relative 'plane'

class Airport

  attr_reader :planes
  attr_accessor :capacity
  AIRPORT_CAPACITY = 100

  def initialize(capacity = AIRPORT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land_plane(plane)
    fail 'Landing prevented due to stormy weather' if @weather == 'stormy'

    fail 'Airport full' if full?

    @planes << plane
  end

  def take_off
    fail 'Take off prevented due to stormy weather' if @weather == 'stormy'

    @planes.pop
    "The plane has taken off"
  end

  def weather
    weather_options = ['sunny', 'stormy']
    @weather = weather_options.sample
  end

  private

  def full?
    return true if @planes.count >= capacity
  end

end
