class Airport
 def initialize
   @allplanes = []
 end
 def planes
   @allplanes
 end

 def plane_land
   @allplanes << Plane.new
 end

 def plane_take_off
   @allplanes.slice!(0)
   @allplanes
 end
end
