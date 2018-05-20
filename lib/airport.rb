require_relative 'plane'

class Airport

  def land(plane)
    fail "Unsafe. Due to the storm #{plane} can not land" if plane.stormy?
    "The following plane: #{plane} has landed"
  end

  def take_off(plane)
    fail "Unsafe. Due to the storm #{plane} can not take off" if plane.stormy?
    "The following plane: #{plane} has taken off"
  end

end
