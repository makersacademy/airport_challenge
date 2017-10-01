require_relative '../lib/plane'

class Airport

  def weather_generator
    rand(10)
  end

  def land_plane(plane)
    @plane_count = 20
    @plane_count +=1 if plane.instance_of? Plane
    fail 'Airport capacity is full. No plane could land.' if @plane_count >= 21
    @plane = plane
  end

  def plane_takeoff
    @plane = Plane.new
    @weather = weather_generator
    fail 'Weather is stormy. No plane takeoff.' if @weather > 7
    @plane
  end

 def confirm_takeoff
    "#{@plane.to_s} has now taken off"
 end

end
