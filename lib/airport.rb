class Airport
attr_reader :stormy_weather

def initialize(capacity, stormy_weather)
  @capacity = capacity
  @stormy_weather = stormy_weather
  @plane = []
end



    def land(new_plane)
      if @stormy_weather == true
        return   false
      else
      true
      end
    end




def take_off(plane)

   if @stormy_weather == true
     false
   else
     true
   end
end




 def confirm_no_plane(plane)

   if @capacity == 0
     true
   elsif @capacity <= 20
     false
   end
 end
end
