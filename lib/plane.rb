class Plane

  def initialize(status = :grounded)
    @status = status
  end

  def land
    fail 'Plane is already grounded' if @status == :grounded
    @status = :grounded
  end

  def take_off
    fail 'Plane is already flying' if @status == :flying
    @status = :flying
  end

end
