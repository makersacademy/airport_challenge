require 'plane'
class Airport
  attr_reader :plane
  attr_reader :capacity

  def initialize(capacity = 1)
    @capacity = capacity
  end

  def land_plane(plane)
    @plane = plane
  end

  def plane_take_off(_plane)
    "Plane left the airport"
  end

  def prevent_take_off_if_stormy(plane)
    @plane = plane
  end

  def prevent_landing_if_stormy(_plane)
    "Plane cannot land due to story weather"
  end

  def prevent_landing_if_airport_is_full
    raise "Airport full" if @capacity.zero?
    
  end
end
