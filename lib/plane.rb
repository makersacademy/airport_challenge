class Plane
  class NotLanded < RuntimeError
  end

  def land(at:)
    @airport = at
    @airport.land_plane(self)
  end

  def take_off
    raise NotLanded if @airport.nil?

    @airport.take_off_plane(self)
    @airport = nil
  end

  def taken_off?
    @airport.nil?
  end
end