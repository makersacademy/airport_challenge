class Plane
  attr_reader :plane_status 

  def take_off
    true
  end

  def land
    true
  end

  def status
    @plane_status
  end
end