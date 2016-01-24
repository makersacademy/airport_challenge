require_relative 'plane'

class Airport

  def initialize
    @landed_planes = []
  end

  def landed_planes
    @landed_planes.dup
  end

  def clear_to_land(plane)
    plane.land
    @landed_planes << plane
  end

  def clear_to_takeoff
    raise 'There are no planes at the airport' if landed_planes.empty?
    @landed_planes.pop
  end

  def confirm_landed(plane)
    plane.landed?
  end

  def stormy?
    @number = rand(1..13)
    @number == 13 ? true:false
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
