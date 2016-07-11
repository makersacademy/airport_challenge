require_relative 'plane'
class Airport

  def initialize
    @hanger = []
  end


  def instruct_landing(plane)
    plane.lands
    @hanger << plane
  end

  def instruct_takeoff(plane)
    @hanger.delete_if { |plane_to_remove| plane_to_remove == plane }
    plane.takesoff
  end
end
