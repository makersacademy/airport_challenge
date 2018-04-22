class Plane
  attr_reader :status

  def initialize
    @status = "Flying"
  end

  def land
    @status = "Landed"
  end
end
