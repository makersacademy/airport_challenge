require_relative 'plane'

class Airport

  attr_reader :cap, :planes

  DEFAULT_CAPACITY=20

  def initialize(cap=DEFAULT_CAPACITY)
    @cap = cap
    @planes = []
  end

  def change_cap(new_cap)
    @cap = new_cap
  end
  
  def land(plane)
    raise 'Error. Unable to land plane due to full capacity' if full?
    raise 'Error. Unable to land a plane that is already landed' if planes.include?(plane)
    raise 'Error. Unable to land plane due to stormy weather' if stormy?
    plane.is_landed
    @planes << plane
  end
  
  def take_off(plane)
    raise 'Error. Unable to take-off a plane that is already flying' if !plane.landed?
    raise 'Error. Unable to take-off a plane from another airport' if plane.landed? && !planes.include?(plane)
    raise 'Error. Unable to take-off plane due to stormy weather' if stormy?
    @planes.pop
    plane.not_landed
  end
  
  private
  
  def stormy?
    return true if rand(50) == 0
    false
  end

  def full?
    return true if planes.count >= cap
    false
  end
end
