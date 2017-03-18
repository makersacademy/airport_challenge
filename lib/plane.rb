class Plane
  attr_reader :status #Call status to confirm that it has landed.

  def initialize
    @status = "Depot"
  end

  def land(airport)
    @status = airport
  end

  def takeoff
    @status = "Flying"
  end
end
