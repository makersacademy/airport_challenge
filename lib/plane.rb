require_relative 'airport'

class Plane

attr_reader :destination

  def initialize
    @flying = true
    @destination = destination
  end

  def flying?
    @flying
  end

  def can_land
    raise 'the plane can not land if it is not flying' if landed?
    @flying = false
    return true
  end

  def landed?
    !@flying
  end

  def can_take_off
    raise 'The plane can not take off if it is not landed' if flying?
    @flying = true
  end
end
