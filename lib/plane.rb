
# Understands how to move through air.

class Plane

  def initialize
  @in_flight = false
  end

  def flying?
    in_flight
  end

  def fly
    @in_flight = true
  end

  def land
    @in_flight = false
  end

    private

    attr_reader :in_flight

end
