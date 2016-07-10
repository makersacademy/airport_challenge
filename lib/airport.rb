# require 'weather'

class Airport

  DEAFAULT_CAPACITY = 50
  attr_accessor :capacity
  attr_reader :landed_planes

  def initialize(capacity=DEAFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'This plane has already landed!' if plane_exists?(plane)
    fail 'Too many planes at this aiport!' if full?
    check_weather
    @landed_planes << plane
    return "A plane has landed!"
  end

  def take_off(plane=@landed_planes.last)
    fail 'This plane is not at the airport!' unless plane_exists?(plane)
    check_weather
    @landed_planes.delete(plane)
    return "A plane has taken off!"
  end

  def build_plane
    fail 'Too many planes at this aiport!' if full?
    @landed_planes << Plane.new
  end

  def check_weather
    fail 'The weather is too stormy right now!' if Weather.stormy?
    return "Good weather to take off..."
  end

  private

  def full?
    @landed_planes.length >= @capacity ? true : false
  end

  def plane_exists?(plane)
    @landed_planes.include?(plane)
  end

  # def ok_to_fly?
  #   Weather.stormy? ? false : true
  # end
end
