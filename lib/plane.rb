class Plane

  attr_accessor :status

  def initialize
    @status = "flying"
  end

  def landed
    @status = "landed"
  end

  def flying
    @status = "flying"
  end
end
