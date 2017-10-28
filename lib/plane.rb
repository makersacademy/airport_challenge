class Plane
  attr_reader :status

  def initialize(status = "flying")
    @status = status
  end

  def land(airport)
    @status = "ground" if airport.request("landing", self)
  end

  def take_off(airport)
    @status = "flying" if airport.request("take_off", self)
  end

end
