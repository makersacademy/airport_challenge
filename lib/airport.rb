require_relative 'plane'
require_relative 'weather'

class Airport
  include Weather

  attr_reader :plane

  def land_a_plane(plane)
    fail 'Unable to land: plane already in airport.' unless @plane.nil?

    @plane = plane
  end

  def take_off_plane
    fail 'Unable to take off: no planes available' unless @plane
    fail 'Take-off ban: storm force winds' unless current_windspeed_report < 7

    plane_that_just_took_off = @plane
    @plane = nil
    plane_that_just_took_off
  end

end
