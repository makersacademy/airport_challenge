class Plane
  attr_reader :status

  def initialize(status = "unassigned")
    @status = status
  end

  def land(airport)
    airport.planes << self
    @status = "landed at #{airport.title}"
  end

  def take_off(airport)
    fail 'The weather is too stormy for take off right now.' if airport.weather == 'stormy'
    airport.planes.delete(self)
    @status = "flying"
  end

end
