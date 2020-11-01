class Airport

  def initialize(capacity)
    @capacity = capacity
    @airplanes = []
  end

  def land(plane)
    if @airplanes.length < @capacity
      @airplanes.push(plane)
      return @airplanes.length
    else
      raise StandardError.new("Airport at full capacity")
    end
  end

  def take_off(plane)
    @airplanes.delete(plane)
    return @airplanes.length
  end

end
