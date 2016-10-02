require_relative 'plane.rb'

class Airport

  attr_reader :weather
  attr_accessor :capacity

  CHANCE_OF_SUN = 1.0
  DEFAULT_CAPACITY = 200

  def initialize(capacity = DEFAULT_CAPACITY)
    @weather = 'sunny'
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    check_weather
    fail "Plane not in flight" if plane.on_ground
    fail "Can't land when stormy" if @weather == 'stormy'
    fail "Airport full" if @planes.count >= @capacity
    plane.on_ground = true
    @planes << plane
  end

  def takeoff(plane)
    check_weather
    fail "Plane already in air" if plane.on_ground == false
    fail "Can't takeoff when stormy" if @weather == 'stormy'
    fail "Plane not in airport" if @planes.include?(plane) == false
    plane.on_ground = false
    @planes.delete(plane)
  end

  def add_new_plane(plane)
    fail "Plane already in airport" if @planes.include?(plane)
    fail "Plane already in air" if plane.on_ground == false
    @planes << plane
  end

  def check_weather
    if rand < Airport::CHANCE_OF_SUN
      @weather = 'sunny'
    else
      @weather = 'stormy'
    end
    @weather
  end

  def find_plane(plane)
    fail "Plane not in airport" if @planes.include?(plane) == false
    puts "Plane in airport"
  end

end
