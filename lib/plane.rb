class Plane
  attr_reader :is_airborne
  
  def initialize(is_airborne = false)
    @is_airborne = is_airborne
  end

  def land
    raise 'Plane is already on the ground' unless @is_airborne

    @is_airborne = false
  end

  def take_off
    raise 'Plane is already airborne' if @is_airborne

    @is_airborne = true
  end
end
