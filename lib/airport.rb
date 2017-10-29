class Airport

attr_reader :plane

  def land
     Plane.new
  end

  def stand_by(plane)
  @plane = plane
  end

end

class Plane
end




  # def standby(plane)
  #
  # end
  #
  # def plane
  #
  # end
