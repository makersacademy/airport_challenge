
class Airport
  attr_accessor :planes_landed
  attr_accessor :capacity

  def initialize
    @planes_landed = 0
    @capacity = 3
  end
 
  def full?
    if planes_landed < capacity
      false
    else
      true
    end
  end

end