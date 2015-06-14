require_relative 'airport'
class Plane

  def initialize 
    @flying = true
    @able_to_land = false
  end
  
  def change_landing_status
  	@able_to_land = true
  end

  def flying?
    @flying
  end

  def able_to_land?
    @able_to_land
  end

  def land_at_airport
  	@landed = true
  	@able_to_land = false
  end

  def landed?
  	@landed
  end

  def take_off
  	@landed = false
  end

end
