require_relative 'airport'

class Plane

  attr_reader :destination

  def initialize(destination)
    @flying = true
    @destination = destination
  end

  def flying?
    @flying
  end

  def can_land
    fail 'Can not land if it is not flying' if landed?
    @flying = false
    return true
  end

  def landed?
    !@flying
  end

  def can_take_off
    fail 'Can not take off if it is not landed' if flying?
    @flying = true
  end
end
