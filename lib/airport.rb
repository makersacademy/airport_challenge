require_relative 'plane.rb'

class Airport

  def initialize
    @runway = []
    # changed planes array to runway to make it more literal
    # also, planes and plane is too similar
  end

  def land(plane)
    @runway << plane
  end

  def take_off(plane)
    @runway.delete(plane)
  end

  def full?
    if true
      return 'The runway is full you cannot land'
    end
  end

  attr_reader :runway
end
