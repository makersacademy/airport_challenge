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
      if @hanger.count >= 20
        fail 'Airport full!'
      else
        incoming_airplane.the_airplane_has_landed_or_taken_off
        @hanger << incoming_airplane
      end
  end
  
  def take_off
      if @hanger.empty?
        fail 'Airport empty!'
      else
        @hanger[0].the_airplane_has_landed_or_taken_off
        @hanger.shift
      end
  end
  
end