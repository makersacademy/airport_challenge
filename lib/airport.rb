class Airport
  attr_accessor :planes, :storm
  
  def initialize
    @planes = []
    @storm = false
  end

  def land_plane(plane)
    @planes << plane
  end

  def launch_plane(plane)
    return "Cannot take-off, weather is stormy." if is_stormy?
    @planes.reject { |item| item == plane }
  end

  private

  def is_stormy?
    storm_generator = rand(5) + 1
    @storm = true if storm_generator == 5
    @storm
  end
end