require 'plane'


class Airport

  attr_reader :landed_planes, :current_weather


  def land(plane)
    @landed_planes = plane
    plane.report_landed
  end

  def take_off(plane)
    raise "Can't take off in storm" if Weather.stormy?
    @landed_planes = nil
    plane.report_taken_off
  end






end
