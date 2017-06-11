class Plane

  attr_accessor :status

  def initialize
    @status = "airborne"
  end

  def ground
    self.status="grounded"
  end

end
