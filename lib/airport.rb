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
    raise 'the plane cannot land because the airport is full' if full_capacity?
    raise 'a non-flying plane cannot land' if plane.flying_status == false
    raise 'this plane is already in this airport' if in_this_airport?(plane)
    plane.dont_fly
    planes << plane
  end

  def plane_take_off (plane)
    raise 'the plane cannot take off as the weather is stormy' if weather?(rand(6)) == 'stormy'
    raise 'there are no planes in the airport' if planes.empty?
    raise 'a flying plane cannot take off' if planes[planes.index(plane)].flying_status
    planes[planes.index(plane)].fly
    planes.delete(plane)
  end

  def full_capacity?
    planes.length == capacity
  end

  def in_this_airport? (plane)
    planes.include? plane
  end

  private

  def weather? (random_number)
    random_number + 1 < 6 ? 'sunny' : 'stormy'
  end

end
