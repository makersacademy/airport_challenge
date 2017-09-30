class Plane

  def land_at(airport)
    raise 'cannot land in stormy weather' unless airport.clear?
  end

  def take_off_from(airport)
    raise 'cannot take off in stormy weather' unless airport.clear?

  end

  def at?(airport)
    false
  end

end