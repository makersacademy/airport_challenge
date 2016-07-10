class Plane
  attr_reader :status
  #remember public/private, only airport can tell the plane to take off
  def initialize
    @status = :flying
  end

  def land #needs to take airport as arg
    @status = :landed
  end

  def take_off
    @status = "in the air"
  end

end
