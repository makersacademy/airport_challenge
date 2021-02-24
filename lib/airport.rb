class Airport
attr_reader :stormy_weather, :empty

def initialize(capacity, stormy_weather)
  @capacity = capacity
  @stormy_weather = stormy_weather
  @empty = empty
  @plane = []
end


  def instruct_plane_land(plane)
    if @capacity <=20
      true
    elsif @stormy_weather == true
        false
    else
       
    end
  end



 def take_off(plane)
   if @stormy_weather == true
     false
   else
     true
   end
 end
 def land(plane)
 end
end
#
#  # def prevent_landing_full?
#  #if @capacity > 0
#
#  #  true
#  # end
#
# end
#
#class Plane
#
# def land
#   0
# end
#
