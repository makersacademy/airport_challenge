require_relative 'plane.rb'

class Airport

  attr_reader :weather
  attr_accessor :capacity

  CHANCE_OF_STORM = 1.0
  DEFAULT_CAPACITY = 200

  def initialize(capacity = DEFAULT_CAPACITY)
    @bad_weather = false
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    check_weather
    fail "Plane not in flight" if plane.on_ground
    fail "Can't land when stormy" if @bad_weather
    fail "Airport full" if full?
    plane.on_ground = true
    @planes << plane
  end

  def takeoff(plane)
    check_weather
    fail "Plane already in air" if plane.on_ground == false
    fail "Can't takeoff when stormy" if @bad_weather
    fail "Plane not in airport" if plane_in_airport?(plane) == false
    plane.on_ground = false
    @planes.delete(plane)
  end

  def add_new_plane(plane)
    fail "Plane already in airport" if plane_in_airport?(plane)
    fail "Plane already in air" if plane.on_ground == false
    @planes << plane
  end

  def check_weather
    if chance > Airport::CHANCE_OF_STORM
      @bad_weather = false
    else
      @bad_weather = true
    end
  end

  def chance
    rand()
  end

  def full?
    @planes.count >= @capacity
  end

  def plane_in_airport?(plane)
    @planes.include?(plane)
  end

  def find_plane(plane)
    fail "Plane not in airport" if plane_in_airport?(plane) == false
    plane
  end

end
