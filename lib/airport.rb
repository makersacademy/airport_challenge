require './lib/plane.rb'
DEFAULT_CAPACITY = 25
class Airport
  attr_reader :hanger, :capacity

  def initialize(constant = DEFAULT_CAPACITY)
    @capacity = constant
    @hanger = []
  end

  def land_plane
    raise "Airport hanger is full" if full?
    @hanger.push(Plane.new)
  end

  def plane_take_off
    @hanger.delete_at(-1)
  end

  def full?
    hanger.count >= DEFAULT_CAPACITY ? true : false
  end

end
