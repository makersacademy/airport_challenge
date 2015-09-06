class Plane

  attr_reader :fly

  def initialize
    @fly = true
  end

  def flying?
    fly
  end

  def land
    @fly = false
  end

  def landed?
    ! flying?
  end

  def take_off
    @fly = true
  end

end
