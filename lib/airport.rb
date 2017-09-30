class Airport

  def full?
    true
  end

  def accept_plane
    raise("Airport full -> can't accept planes!") if full?
  end

  def plane_take_off
  end

end
