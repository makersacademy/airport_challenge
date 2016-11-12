require_relative 'plane'

class AirportController

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    plane.report_landing
    @planes = plane
  end

  def take_off_plane
    raise "There are no planes in the airport" if @planes.empty?
    @planes.pop
  end



end
