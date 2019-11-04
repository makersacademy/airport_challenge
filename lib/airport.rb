class Airport
 def initialize
   @allplanes = ["Initial Plane"]
 end
 def planes
   @allplanes
 end

 def plane_land
   @allplanes << Plane.new
 end

 def plane_take_off
   @allplanes.shift
 end
end
