require_relative '../domain/aeroplane'
require_relative '../errors/not_a_plane_error'

class PlaneManagementService

  def initialize
    @planes = []
  end

  def add_plane(plane)
    raise NotAPlaneError.new(plane) if not_a_plane?(plane)
    @planes << plane
    :ok
  end

  def find_plane_by_id(id)
    @planes.find { |plane| plane.id == id } 
  end

  def find_planes_by_airport(code)
    @planes.select { |plane| plane.status == code } 
  end

  def find_flying_planes
    @planes.select { |plane| plane.status == Aeroplane::FLYING } 
  end

  def update_plane_status(id, status)
    plane = find_plane_by_id(id)
    plane.update_status(status)
    "new plane status: #{plane.status}"
  end

  private 

  def not_a_plane?(plane)
    plane.class != Aeroplane
  end

end
