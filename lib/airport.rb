require_relative 'plane'
require_relative 'weather'

class Airport
  include Weather

  def initialize
    @planes = []
  end

  attr_reader :planes

  def land_a_plane(plane)
    fail 'Landing ban: storm force winds' unless current_windspeed_report < 7
    fail 'Unable to land: airport full.' if @planes.length >= 20
    fail 'Unable to land: plane already in airport.' if @planes.include?(plane)

    @planes.push(plane)
  end

  def take_off_plane(plane)
    fail 'Take-off ban: storm force winds' unless current_windspeed_report < 7

    fail 'Unable to take off: no planes available' if @planes.empty?

    fail 'Unable to take off: plane not @ airport' unless @planes.include? plane

    plane_index = @planes.index(plane)
    @planes.delete_at(plane_index)
    plane
  end

end
