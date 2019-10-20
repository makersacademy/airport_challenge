class Airport
  def plane_leaves
    @plane = false
  end

  def plane?
    @plane
  end

  def stormy?
    rand > 0.7
  end
end
