class Plane

  def initialize
    @status = "flying"
  end

private

attr_accessor :status

  def plane_landed
    @status = "landed"
  end

  def plane_taking_off
    @status = "flying"
  end

end
