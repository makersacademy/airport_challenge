class Airport

  def land(plane)
    @plane = plane           # in order for a plane to take-off, there has to be a plan that has landed.
  end                        # and we connect both by making an instance variable of plane

  def take_off
    @plane
  end

end
