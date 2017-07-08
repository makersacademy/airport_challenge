class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    @planes << plane
    puts "#{plane} has landed"
  end

  def take_off(plane)
    @planes.delete(plane)
    puts "#{plane} has taken off"
  end
end
