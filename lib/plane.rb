class Plane

  def initialize(status = :grounded)
    @status = status
  end

  def land
    @status = :grounded
  end

  def take_off
    fail 'Plane is already flying' if @status == :flying
    @status = :flying
  end

end
