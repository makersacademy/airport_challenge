class Plane

  attr_accessor :landed

  def initialize (status = true)
    @landed = status
  end

  def land
    landed = true
  end

  def flying
    landed = false
  end

end
