
# Understands how to move through air.


# Right now: I can place a plane in flight wheneve I want.
# if not flying fail.


class Plane

  def initialize
  @in_flight = false
  end

  def flying?
    in_flight
  end

  def fly
    self.in_flight = true
  end

  def land
    self.in_flight = false
  end

  private

    attr_accessor :in_flight

end
