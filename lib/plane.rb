class Plane
  #This class has the planes status of flight
  attr_reader :isFlying

  def initialize(isFlying = true)
    @isFlying = isFlying
  end

  def flying
    @isFlying = true
  end

  def landed
    @isFlying = false
  end
end
