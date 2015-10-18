require_relative 'plane'
class Airport

  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @weather = 'sunny'
    @planes = []
    raise 'capacity must be an integer' if !(capacity.is_a? Integer)
    @capacity = capacity
  end

  def plane_land (plane)
    raise 'the plane cannot land as the weather is stormy' if weather?(rand(6)) == 'stormy'
    raise 'the plane cannot land because the airport is full' if planes.length >= capacity
    raise 'a non-flying plane cannot land' if plane.flying_status == false
    plane.flying_status = false
    plane.in_airport = true
    planes << plane
  end

  def plane_take_off
    raise 'the plane cannot take off as the weather is stormy' if weather?(rand(6)) == 'stormy'
    raise 'there are no planes in the airport' if planes.empty?
    raise 'a flying plane cannot take off' if planes.last.flying_status
    planes.last.flying_status = true
    planes.last.in_airport = false
    planes.pop
  end

  private

  def weather? (random_number)
    random_number + 1 < 6 ? 'sunny' : 'stormy'
  end

end