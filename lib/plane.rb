require_relative 'airport'

class Plane
  attr_reader :flying

  def initialize(destination)
    @flying = true
    @destination = destination
  end

  def flying?
    flying
  end

  def land
    fail 'Can not land if it is not flying' if landed?
    @flying = false
    true
  end

  def landed?
    not flying
  end

  def take_off
    fail 'Can not take off if it is not landed' if flying?
    @flying = true
  end
end
