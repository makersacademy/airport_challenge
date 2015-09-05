class Plane
 def initialize
   @flying = true
  #  @landed = false
 end

 def flying?
   @flying
 end

 def can_land
    raise 'the plane cannot land if it is not flying' if landed?
    @flying = false
    return true
  end

 def landed?
   !@flying
 end

 def can_take_off
   raise 'cant take off when already flying' if flying?
   @flying = true
 end
end
