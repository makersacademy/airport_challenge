require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport
  
  attr_reader :hanger
  
  def initialize
      @hanger = []
  end
  
  def permission_from_traffic_control(weather_report)
     if weather_report == "Sunny"
       @permission = true
    else
       @permission = false
     end
  end
  

   def permission_to_land(incoming_airplane)
      if @permission
        land(incoming_airplane)
      else
        'No permission to land due to poor weather!'
      end
   end
     
   def permission_to_take_off
     if @permission
       take_off
     else
       'No permission to take off due to poor weather!'
     end
   end
    
 
  def land(incoming_airplane)
    
      incoming_airplane.the_airplane_has_landed_or_taken_off
      @hanger << incoming_airplane
  end
  
  def take_off
      @hanger[0].the_airplane_has_landed_or_taken_off
      @hanger.shift
  end
  
end