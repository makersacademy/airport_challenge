require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 10

  attr_accessor :capacity, :storm

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes_at_airport = []
    @capacity = capacity
    weather_today = Weather.new
    @weather = weather_today.storm
  end

  def plane_lands(plane)
    fail 'It is too stormy to land' if storm
    fail 'Airport is full' if airport_full
    fail 'Plane is already at the airport' if plane.at_airport? == true

    plane.at_airport?
    @planes_at_airport << plane

  end

  def plane_takes_off(plane)
    fail 'It is too stormy to take off' if storm
    fail 'The plane has already taken off' unless plane.at_airport? == true
    
    @planes_at_airport.pop
  end

  private

  attr_reader :planes_at_airport

  def airport_full
    @planes_at_airport.count >= capacity
  end

  def airport_empty
    @planes_at_airport.empty?
  end

end
