class Airport
 def initialize
   @allplanes = []
 end
 def planes
   @allplanes
 end
 def capacity
   capacity = 10
 end
 def plane_land
   fail 'Airport Full' if @allplanes.count >= capacity
   @allplanes << Plane.new
 end

 def plane_take_off
   @allplanes.slice!(0)
   @allplanes
 end
end
