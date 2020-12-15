require 'traffic_controller'

class Plane

  def land(controller)
    begin
      controller.try_land(self)
    rescue RuntimeError
      puts "Unsuccessful landing"
    else
      puts "Successful landing"
    end
  end

  def take_off(controller)
    begin
      controller.try_take_off(self) 
    rescue RuntimeError
      puts "Unsuccessful take off"
    else
      puts "Successful take off"
    end
  end
 
end
