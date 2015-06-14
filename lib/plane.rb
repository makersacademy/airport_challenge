require_relative 'airport'
class Plane

  def initialize 
    @flying = true
    @able_to_land = false
  end
  
  def change_landing_status
  	@able_to_land = true
  end

  def land_at_airport
  	@landed = true
  	@able_to_land = false
  	@flying = false
  end

  def take_off
  	@landed = false
  	@flying = true
  end

  def confirm_take_off
    @ready_to_take_off = true
  end


  def flying?
    @flying
  end

  def able_to_land?
    @able_to_land
  end

  def landed?
  	@landed
  end
  
  def ready_to_take_off?
  	@ready_to_take_off
  end

end
