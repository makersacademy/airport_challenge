require_relative "plane.rb"

class Airport
  DEFAULT_CAPACITY = 20
  
  def initialize
    @planes = []
  end

  def land(plane)
    fail("Airport full! Plane cannot land") if full?
  end

  def lift(plane)
    "Plane has taken off and is no longer in airport"
  end

  private # as per walkthrough 15

  def full?
    true
  end

  def empty?
  end
end
