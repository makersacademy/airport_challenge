require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail "Airport is full" if full?

    fail "This plane has already landed" if duplicate? plane

    plane.set_as_landed
    @planes << plane
  end

  def takeoff
    fail "No planes are at the airport" if empty?

    @planes[-1].set_as_flying
    @planes.pop
  end

  private
  
  def full?
    @planes.count >= 10
  end

  def duplicate?(value_to_check)
    @planes.include? value_to_check
  end

  def empty?
    @planes.empty?
  end
end
