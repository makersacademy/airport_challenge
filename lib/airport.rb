require "weather"

class Airport
  include Weather
  attr_reader :planes
  
  def initialize
    @planes = []
  end

  def land_plane(plane)
    return "Cannot land, weather is stormy." if is_stormy?
    @planes << plane
  end

  def launch_plane(plane)
    return "Cannot take-off, weather is stormy." if is_stormy?
    @planes.reject { |item| item == plane }
  end

  def full?
    "Cannot land, airport full." if true
  end
end