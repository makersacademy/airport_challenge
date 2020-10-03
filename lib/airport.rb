require 'plane'
require 'weather'

class Airport

  CAPACITY = 3

  attr_accessor :hangar

  def initialize
    @hangar = []
  end

  def request_landing(plane)
    full?
    plane.land(self)
  end

  def request_take_off(plane)
    plane.take_off(self)
  end

  private

  def full?

    return raise "Hangar is full" if @hangar.length >= CAPACITY

  end

end
