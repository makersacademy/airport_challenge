module PlaneContainer
  attr_reader :list_planes

  def setup_plane_list
    @list_planes = []
  end

  def plane_in(plane)
    @list_planes << plane
  end

  def plane_out(plane)
    @list_planes.delete(plane)
  end
end
