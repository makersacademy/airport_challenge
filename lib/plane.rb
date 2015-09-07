class Plane
  attr_accessor :status

  def initialize
    @status = :flying
  end

  def land
    @status = :landed
  end

  def take_off
    @status = :flying
  end
  
end
