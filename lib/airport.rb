class Airport

  def confirm_plane_absence(plane)
    plane.location != self
  end

end
