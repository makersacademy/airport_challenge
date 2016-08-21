class Plane
attr_accessor :status

  def initialize
    @status = "flying"
  end

  def plane_landed
    @status = "landed"
  end

end
