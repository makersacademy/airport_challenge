class Airport

  def initialize
    @parkedplanes = []
    @capacity = 2
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
