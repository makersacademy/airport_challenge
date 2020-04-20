

class Airport
  attr_accessor :capacity, :stormy

  def land(plane)
    @stormy == rand(1..10) > 9
  end

  def take_off(plane)
    @stormy == rand(1..10) > 9
  end
  def land_full(plane)
    @capacity == ()
  end
end
