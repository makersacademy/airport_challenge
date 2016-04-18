class Plane

  attr_reader :landed_status

  def initialize
    @landed_status = false
  end

  def land
    @landed_status = true
  end

  def depart
    @landed_status = false
  end

end
