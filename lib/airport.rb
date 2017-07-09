require_relative 'plane'

class Airport

  # attr_accessor : @planes, @capacity
  #
  # DEFAULT_CAPACITY = 20
  #
  #
  # def initialize(capacity = DEFAULT_CAPACITY)
  #   @planes = []
  # end


  def land(plane)
    fail 'Landing not allowed due to stormy weather' if stormy?
    landed = true
  end


  def take_off(plane)
    fail 'Take off not allowed due to stormy weather' if stormy?
    landed = false

  end


  def landed?
    @plane.landed
  end

  def stormy?
    return [true,false].sample
  end


end
