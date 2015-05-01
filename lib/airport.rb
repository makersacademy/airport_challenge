class Airport

  def initialize(capacity=2)
    @parkedplanes = []
    @capacity = capacity
  end

  def land(plane)
    if @parkedplanes.length < @capacity
      plane::status = "landed"
      @parkedplanes << plane
    else
      fail 'The airport is full'
    end
  end

  def take_off (plane)
    plane::status = "flying"
    @parkedplanes.delete(plane)
  end

end
