require_relative 'plane'

class Airport
  attr_reader :hanger, :capacity

  def initialize(capacity = 2, hanger = [])
    @capacity = capacity
    @hanger = []
  end

  def land(plane)
    if self.full?
      raise "Airport full, ABORT LANDING"
    elsif @hanger.include?(plane)
      raise "This plane has already landed"
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
