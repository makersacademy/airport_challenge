require 'plane'

class Airport

  attr_reader :landed_planes


  def land(plane)
    @landed_planes = plane
    plane.report_landed
  end

  def take_off(plane)

    @landed_planes = nil
    plane.report_taken_off
  end



  def get_weather

  end


end
