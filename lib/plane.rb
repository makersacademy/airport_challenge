class Plane
  attr_reader :status

  def initialize
    @status = "Depot"
  end

  def land(airport)
    @status = airport
  end
end
