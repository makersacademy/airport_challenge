require 'traffic_controller'

class Plane
  
  def land(controller)
    puts controller.try_land(self) ? "Successful landing" : "Could not land"
  end

  def take_off(controller)
    puts controller.try_take_off(self) ? "Successful take off" : "Could not take off"
  end
 
end
