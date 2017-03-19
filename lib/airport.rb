require_relative 'plane'
class Airport

  AIRPORT_CAPACITY = 20

  attr_reader :capacity

  def initialize
    @planes = []
    @capacity = AIRPORT_CAPACITY
  end

  public

  def land(plane)
    fail "Bad weather today. Cannot land." if stormy_weather?
    fail "Sorry. Airport full. Go away." if full?
    fail "This plane is already landed." if plane.landed?
    plane.land_plane
    planes << plane
  end

  def take_off(plane)
    fail "Bad weather today. Cannot take off." if stormy_weather?
    fail "Plane is already in the air!" if !plane.landed?
    plane.take_off_plane
    planes.delete(plane)
  end

  def set_capacity(number)
    @capacity = number
  end

  def stormy_weather?
    random_number = rand(10)
    if random_number >= 8
      true
    else
      false
    end
  end

  private

  def full?
    planes.count >= capacity
  end

  attr_reader :planes

end
