require_relative 'air_traffic_control.rb'

class Airport
  attr_writer :plane
  alias_method :land_plane, :plane=

  def takeoff_plane
    fail 'No plane to takeoff' unless @plane
    @plane
  end

  def atc
  end
end
