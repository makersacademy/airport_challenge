class Airport
  def land plane
    plane.status "landed"
  end
  def launch plane
    plane.status "flying"
  end
end
