class PlaneError < StandardError
  def initialize(msg = "Plane Error cannot perform command")
    super
  end
end

class AirportError < StandardError
  def initialize(msg = "Airport Error cannot perform command")
    super
  end
end
