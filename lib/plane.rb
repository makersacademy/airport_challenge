class Plane
  class NotLanded < RuntimeError
  end

  attr_reader :airport

  @airport

  def land(at:)
    @airport = at
  end

  def take_off
    raise NotLanded if @airport.nil?

    @airport.take_off(self)
    @airport = nil
  end

  def taken_off?
    @airport.nil?
  end
end