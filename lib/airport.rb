class Airport
attr_reader :plane

  def land(plane)
    raise "There is no space at this airport" if @plane
    @plane = plane
  end

  # def take_off
  #   @plane
  # end

end
