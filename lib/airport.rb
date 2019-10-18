class Airport
  attr_accessor :hangar

  def initialize
  end

  def instruct_landing(plane)
    plane.land
  end

  def instruct_take_off(plane)
    plane.take_off
  end
end
