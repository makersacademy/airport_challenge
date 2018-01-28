class Plane

  attr_accessor :status
  attr_reader :plane

  def initialize
    @status = status
  end

  def land
    @status = "grounded"
  end

  def takeoff
    @status = "flying"
  end

end
