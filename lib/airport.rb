require_relative 'plane.rb'

class Airport
  attr_reader :planes, :capacity
  Default_capacity = 10

  def initialize(capacity=Default_capacity)
    @capacity = capacity
    @planes = []
  end

  def landing_plane(plane)
    p ok_to_land = plane.weather
    if ok_to_land == "Welcome, you're clear to land"
    fail "No space currently available" if full?
    @planes << plane
  else

  end
  end

  def take_off(plane)
    p ok_to_take_off = plane.weather
    if ok_to_take_off == "Welcome, you're clear to land"
      @planes.delete(plane)
      p @planes
    end
  end


  def full?
    @planes.count >= @capacity
  end

end
