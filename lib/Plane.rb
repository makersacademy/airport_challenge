class Plane

  attr_accessor :status

  def initialize
    @status = "airborne"
  end

  def ground
    self.status=("landed")
  end

end
