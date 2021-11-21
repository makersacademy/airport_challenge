class Airport
  def initialize(capacity = 20)
    @capacity = capacity
    @hanger = []
  end

  def hanger_full?
    return @hanger.length == @capacity
  end

  def in_hanger?(plane)
    return @hanger.include?(plane)
  end

  def land(plane, weather)
    if plane.location == :airbourne && !hanger_full?() && weather < 8
      plane.location = self
      @hanger << plane
    end
  end

  def take_off(plane, weather)
    if plane.location == self && weather < 8
      plane.location = :airbourne
      @hanger.delete(plane)
    end
  end
end
