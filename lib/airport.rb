require_relative "plane"
require_relative "weather"

class Airport
  include Weather
  attr_accessor :capacity, :hangar, :planes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
    @planes = []
  end

  def land_plane(plane)
    plane.land
    @planes << plane
  end


end
