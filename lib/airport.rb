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

  def land(plane)
    if plane.location == :airbourne && !hanger_full?()
      plane.location = self
      @hanger << plane
    end
  end

end
