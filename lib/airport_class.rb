require_relative 'plane.rb'

class Airport
  #airport = Airport_class.new
  def initialize
    @plane  = []
  end

  def land(plane)
    @plane << plane
    return "#{plane} has landed"
      #plane
  end

  def takeoff(plane)
     @plane << plane
     plane = @plane.pop
     return "#{plane} has takenoff"
  end

  def stormy?
    weather = ["stormy", "sunny"]



  # def full(plane)
  #   if @plane.length < 1
  #      @plane << plane
  #   else
	#     raise "airport is full"
  #   end
  # end

  def full
    plane = Plane.new
    @plane << plane
    fail "airport is full" if @plane.length == 1
    @plane
  end

end
