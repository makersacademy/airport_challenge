class Airport

  attr_reader :landed_planes
  attr_writer :landed_planes

  def  initialize
    @landed_planes = Array.new
  end

  def confirm_plane_landed(plane)
    @landed_planes.include?(plane)
  end

end
