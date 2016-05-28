require_relative 'plane'

class Airport

  def initialize
    @capacity = []
  end

  def land(plane)
    aircraft_hanger << plane
    "You have landed plane: #{plane}"
  end

  def take_off
    plane_departure
  end

  private

  attr_accessor :capacity
  attr_reader :plane

  def aircraft_hanger
    capacity
  end

  def plane_departure
    departure = capacity.pop
    "The flight now leaving is: #{departure}"
  end

end
