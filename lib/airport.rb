require_relative 'plane'

class Airport

  def initialize
    @landed_planes = []
  end

  def landed_planes
    @landed_planes.dup
  end

  def clear_to_land(plane)
    fail 'Stormy weather is preventing landing' if stormy?
    plane.land
    @landed_planes << plane
  end

  def clear_to_takeoff
    fail 'Stormy weather is preventing takeoff' if stormy?
    fail 'There are no planes at the airport' if landed_planes.empty?
    plane = @landed_planes[0]
    plane.takeoff
    @landed_planes.delete_at(0)
  end

  def confirm_landed(plane)
    plane.landed?
  end

  def stormy?
    rand(1..3) == 13 ? true:false
  end







  # def clearance?
  #   true
  # end
  #
  # def plane_lands(plane)
  #   fail "Plane does not have clearance to land" if plane.clearance == false
  #   @landed_planes << plane
  # end
  #
  # def reset_clearance
  #   @landed_planes.each {|plane| plane.request_clearance(self)}
  # end

end
