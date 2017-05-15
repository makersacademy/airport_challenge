class Plane
  attr_reader :landing_status

  def initialize
    @landing_status = :airborn
  end

  def land
    @landing_status = :landed
  end

  def take_off
    @landing_status = :airborn
  end
end
