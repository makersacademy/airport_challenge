class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    departed_plane = @planes.pop
    puts "Plane has departed" if departed? departed_plane
  end

  def departed?(plane)
    !@planes.include?(plane)
  end

end
