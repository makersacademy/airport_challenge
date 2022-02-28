class AirPlane
  attr_reader :flying
  def initialize(flying = true)
    @flying = true
  end
  def set_status_as_flying
    @flying = true
  end

  def set_status_as_landed
    @flying = false
  end
end
