class Plane

  def initialize(status = :grounded)
    @status = status
  end

  def land
    @status = :grounded
  end

  def take_off
    @status = :flying
  end

end
