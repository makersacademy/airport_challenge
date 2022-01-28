require_relative "./plane"

class Airport
  
  attr_reader :plane_list

  def initialize
    @plane_list = []
  end

  def add_plane(plane)
    @plane_list << plane
  end

  def remove_plane(plane)
    @plane_list.delete(plane)
  end

end
