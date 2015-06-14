class Airport

  def initialize
    @planes = []
    @capacity = 10
  end

  def instruct_plane_to_take_off plane
    plane.takeoff
    release_plane(plane)
  end

  def instruct_plane_to_land plane
    plane.land
    receive_plane plane
  end

  def release_plane plane
    planes.delete(plane)
  end

  def receive_plane plane
    planes << plane
  end

  def empty?
    planes.empty?
  end

  private

  attr_accessor :planes

end
