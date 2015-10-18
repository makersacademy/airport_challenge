require "plane"

class Airport
  attr_reader :planes
  attr_accessor :capacity, :stormy
  def initialize(cap=1)
    @planes = []
    @stormy = stormy?
    @capacity = cap
  end

   def land(plane)
     raise "cannot land a plane that is not flying" unless plane.flying
     raise "cannot land when stormy" if @stormy
     raise "cannot land a flying plane without permission" unless plane.landing
     raise "airport is at capacity" if full
     plane.landed
     @planes << plane

   end

   def airport_take_off
     out_plane = @planes.pop
     out_plane.take_off
     out_plane
   end

   private

   def full
     @planes.length >= capacity ? true : false
   end

   def stormy?
     rand(10) > 6 ? true : false
   end
end
