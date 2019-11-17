require "./lib/plane.rb"

class Airport
  
  attr_accessor :capacity, :airport_name

  DEFAULT_CAPACITY = 30

  DEFAULT_NAME = :airport

  def initialize( airport_name = DEFAULT_NAME, capacity = DEFAULT_CAPACITY )
    @airport_name = airport_name
    @capacity = capacity
    @planes_at_airport = []
  end

  def land(plane)
    storm_warning
    raise "Airport full, plane cannot land yet" if full?
    raise "Plane already landed" if @planes_at_airport.include?(plane)
    plane.land_at(@airport_name)
    @planes_at_airport << plane
  end

  def take_off(plane)
    storm_warning
    raise "Plane not currently landed at this airport" if !@planes_at_airport.include?(plane)
    @planes_at_airport.delete(plane)
    "Plane has taken off"
  end

  private

  def full?
    @planes_at_airport.size >= @capacity ? true : false
  end

  def weather_conditions
    rand(11)
  end

  def storm_warning
    raise "It is too stormy to take off or land right now" if weather_conditions >= 9
  end

end


