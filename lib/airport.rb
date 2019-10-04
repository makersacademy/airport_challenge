require '/Users/student/projects/airport_challenge/lib/plane.rb'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def add_plane(plane)
    @planes << plane
  end

  def remove_plane(plane)
    @planes.delete(plane)
  end

end
