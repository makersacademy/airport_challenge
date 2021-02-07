require_relative 'plane'

class Airport
  attr_reader :hanger, :capacity

  def initialize(hanger = [], capacity)
    @hanger = []
    @capacity = capacity
  end

  def land(plane)
    if self.full?
      raise "Airport full, ABORT LANDING"
    else
    @hanger << plane
    end
  end

  def take_off(plane)
    if @hanger.include?(plane)
    @hanger.delete(plane)
    @hanger
  else
    raise "Plane not available to take off"
  end
  end

  def full?
    if @hanger.length >= @capacity
      true
    end
  end

end
