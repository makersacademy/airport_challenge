class Airport

  attr_reader :plane

  def land(plane)
    raise 'Airport full.' if @plane
    @plane = plane
  end


  def take_off(plane)
    @plane = nil
  end

end
