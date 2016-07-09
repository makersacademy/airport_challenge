require_relative 'plane'

class Airport

  # come back and sort this out
  def stormy
    @stormy = true
  end

  def land(plane)
    raise "Abort landing. Stormy weather." if @stormy
    "Plane #{plane} has landed."
  end

  def take_off(plane)
    raise "Abort take off. Stormy weather." if @stormy
    "Plane #{plane} is in the air."
  end

end
