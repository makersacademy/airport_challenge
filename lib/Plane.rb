class Plane

attr_reader :landed

  def initialize
    @landed = false
  end

  # design means the plane disappears on take off
  # new plane is created for landing
   def takeoff
     @landed = false
   end

  def land
    @landed = true
  end
  
  def on_ground?
    @landed == true
  end
end
