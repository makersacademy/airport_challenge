class Plane
  attr_reader :status

  def take_off
    @status = "Has taken off"
  end

  def land
    @status = "Landed"
  end

end
