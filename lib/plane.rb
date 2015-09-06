class Plane
  attr_reader :plane_status
  def initialize
    @status = [:flying, :landed]
    @plane_status = @status[0]
  end

  def take_off
    @plane_status = @status[0]
  end

  def land
    @plane_status = @status[1]
  end
end
