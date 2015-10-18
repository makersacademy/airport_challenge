class Airport

  attr_reader :plane

  def land(plane)
    raise 'Airport full.' if @plane
    @plane = plane
  end


  def take_off(plane)
    raise 'Plane not at airport.' unless @plane == plane
    @plane = nil
  end

end
