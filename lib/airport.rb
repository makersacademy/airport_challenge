require_relative 'planes'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    hangar << plane
    p "Plane landed"
  end

  def takeoff(plane)
    hangar.pop
    p "Plane taken off"
  end

  def is_empty
    if hangar.empty?
      true
    else
      false
    end
  end

end