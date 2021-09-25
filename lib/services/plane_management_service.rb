require_relative '../domain/aeroplane'
require_relative '../errors/not_a_plane_error'

class PlaneManagementService

  def initialize
    @planes = []
  end

  def add_plane(plane)
    if not_a_plane?(plane)
      raise NotAPlaneError.new(plane)
    else
      @planes << plane
      :ok
    end
  end

  def find_plane_by_id(id)
    @planes.find { |plane| plane.id == id} 
  end

  private 

  def not_a_plane?(plane)
    plane.class != Aeroplane
  end

end