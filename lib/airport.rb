require_relative 'plane'
require_relative 'weather'

class Airport
include Weather

attr_reader :landing_bay

  def initialize()
    @landing_bay = []
  end

  def land_plane(plane)
    raise "Stormy Weather Alert: Landing not permitted" if Weather.stormy?
    plane = plane
    plane.change_status("Landed")
    @landing_bay << plane
  end

  def take_off
    raise "Stormy Weather Alert: Take-off not permitted" if Weather.stormy?
    take_off_plane = @landing_bay.first
    @landing_bay = @landing_bay.drop(1)
    take_off_plane.change_status("Airbourne")
  end

end
