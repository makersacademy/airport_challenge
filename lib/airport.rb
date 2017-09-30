class Airport

  # attr_reader :plane

  def land(plane)
    fail 'Airport is full!' if @plane
    @plane = plane
  end

  def take_off
    @plane
  end

end
