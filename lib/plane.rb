class Plane

  def initialize
    @status = :flying
  end

attr_reader :status

  def plane_landed
    @status = :landed
  end

  def plane_taking_off
    @status = :flying
  end

end
