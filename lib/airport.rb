require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport
  
  attr_reader :hanger, :capacity
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
      @hanger = []
      @capacity = capacity
  end
  
  def weather_report(weather)
      weather == "Sunny" ? @permission = true : @permission = false
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
    
  def full?
    @hanger.count >= @capacity
  end
  
  def the_plane_has_already_landed?(incoming_airplane)
    @hanger.include?(incoming_airplane)
  end
  
  def land(incoming_airplane)
    fail 'Airport full!' if full?
    fail "This Plane has already landed!" if the_plane_has_already_landed?(incoming_airplane)
   
    incoming_airplane.the_airplane_has_landed_or_taken_off
    @hanger << incoming_airplane
      
  end
  
  def take_off
    fail 'Airport empty!' if @hanger.empty?
    @hanger[0].the_airplane_has_landed_or_taken_off
    @hanger.shift
   
  end
  
end