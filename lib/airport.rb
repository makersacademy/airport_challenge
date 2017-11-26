require "plane"
require "hand_of_god"

class Airport
# Requiments / Modules
  include Weather

# Methods
  def initialize
    @planes = []
  end

  def dock(plane)
    @planes << plane
  end

  def launch(plane)
    @planes.delete(plane)
  end

  def count_of_planes
    @planes.count
  end

end
