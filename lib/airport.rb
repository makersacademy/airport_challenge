class Airport
  def plane_leaves
    @plane = false
  end

  def has_plane?
    @plane
  end

  def stormy?
    rand > 0.7
  end
end
