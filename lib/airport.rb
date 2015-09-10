require_relative 'plane'

class Airport

  CAPACITY = 20

  attr_reader :planes

  def initialize
    @planes = []
  end

  def allow_take_off
    fail "Sorry, bad weather" if rand_num == 1
    fail "No planes at the airport" if empty?
    plane = @planes.pop
    plane.take_off
  end

  def allow_land(plane)
    fail "Sorry, bad weather" if rand_num == 1
    fail "Airport is full pilot" if full?
    plane.land
    @planes << plane
  end

  def forecast
    return "stormy" if rand_num == 1
    "sunny"
  end

  def rand_nam
    rand(2)
  end

  private

  def empty?
    @planes.empty?
  end

  def full?
    @planes.count >= CAPACITY
  end
end
