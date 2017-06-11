
# Understands how to move through air.


class Plane

  def initialize
    @in_flight = true
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
