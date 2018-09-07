require_relative 'plane'

DEFAULT_CAPACITY = 10

class Airport

  def initialize
    @planes = []
  end

  def land_plane(plane)
    fail "No space to land" if airport_full?
    fail "The weather is too bad to land" if stormy?
    @planes << plane
  end

  def take_off
    fail "The weather is too bad to take off" if stormy?
    puts "Plane #{@planes[-1]} has departed"
    @planes.pop
  end

  def stormy?
    # 0-7 is good weather, 8-9 is a storm
    rand(10) >= 8
  end

  def airport_full?
    @planes.count > DEFAULT_CAPACITY
  end

end
