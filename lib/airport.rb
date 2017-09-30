class Airport

  def land(plane)
    fail "Airport is full!" if @plane
    @plane = plane                          # in order for a plane to take-off, there has to be a plan that has landed.
  end                                      # and we connect both by making an instance variable of plane

  def take_off
    fail "no planes available for take-off!" unless @plane
    @plane
  end

end
