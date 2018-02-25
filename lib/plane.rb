class Plane
  #setting plane status - "landed" or "in-flight"
  attr_accessor :plane_status

  def initialize
    @plane_status = "in-flight"
  end

end
