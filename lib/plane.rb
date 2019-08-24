class Plane
  class NotLanded < RuntimeError
  end

  class AlreadyLanded < RuntimeError
  end

  def land(at:)
    raise AlreadyLanded unless taken_off?

    @airport = at
    @airport.land_plane(self)
  end

  def take_off
    raise NotLanded if taken_off?

    @airport.take_off_plane(self)
    @airport = nil
  end

  def taken_off?
    @airport.nil?
  end
end