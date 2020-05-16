class Airport

  def land(plane)
     raise 'Airport full' if @plane 
     @plane = plane
  end

  def take_off(plane)
    # "#{@plane} has taken off"
  end

end
