class Plane
  attr_reader :status

  def initialize
    @landing_status = "airborn"
  end

  def landed?
    @landing_status
  end

  def land
    @landing_status = "landed"
  end
end
