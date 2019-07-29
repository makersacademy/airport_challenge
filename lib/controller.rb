require 'airport_runway'
require 'plane'
require 'airport_hanger'
#
class Controller

  def runwayweather(runway)
    if runway.stormcheck?
      runway.report_storm
    end
  end


  def greenlightlanding(hanger, runway, plane)
    if runway.weather?
      hanger.land(plane)
    else
      fail 'cannot land'
    end
  end

  def greenlighttakeoff(hanger, runway, plane)
    if runway.weather?
      hanger.takeoff
    else
      fail 'cannot take off'
  end
end

end
