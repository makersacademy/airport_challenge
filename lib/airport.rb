
require_relative 'plane'

class Airport

attr_reader :landing_bay

  def initialize()
    @landing_bay = []
  end

  def land_plane(plane)
    plane = plane
    plane.change_status("Landed")
    @landing_bay << plane
  end

  def take_off
    take_off_plane = @landing_bay.first
    @landing_bay = @landing_bay.drop(1)
    take_off_plane.change_status("Airbourne")
  end


end
