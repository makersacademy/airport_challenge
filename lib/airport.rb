require_relative '../lib/plane'

class Airport

  def land_plane(plane)
    @plane_count = 20
    @plane_count +=1 if plane.instance_of? Plane
    fail 'Airport capacity is full. No plane could land.' if @plane_count >= 21
    @plane = plane
  end

  def plane_takeoff
    @plane = Plane.new
    @plane
  end

 def confirm_takeoff
    "#{@plane.to_s} has now taken off"
  end

end
