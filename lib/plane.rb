class Plane
  attr_reader :destination

 def initialize destination
   @flying = true
   @destination = destination
 end

 def flying?
   @flying
 end

 def can_land
    fail 'the plane cannot land if it is not flying' if landed?
    @flying = false
    true
  end

 def landed?
   !@flying
 end

 def can_take_off
   fail 'cant take off when already flying' if flying?
   @flying = true
 end
end
