require_relative 'plane.rb'

class Airport
  #airport = Airport_class.new
attr_reader :plane, :weather
DEFAULT_CAPACITY = 10
  def initialize(capacity = DEFAULT_CAPACITY)
    @plane  = []
    #@weather = rand(1..10)
    @weather = ["stormy", "sunny", "sunny", "sunny", "sunny"].sample
    @capacity = capacity
  end

  def land(plane)
    raise "no landing stormy conditions" if weather.stormy
    @plane << plane
    return "#{plane} has landed"
      #plane
  end

  def takeoff(plane)
     @plane << plane
     plane = @plane.pop
     return "#{plane} has takenoff"
  end

  # def stormy?
  #   if @weather >= 8
  #     puts "stormy"
  #   else
  #     puts "sunny"
  #   end
  # end

  def stormy
    if @weather == "sunny"
      land(plane)
    else
      return "no landing stormy conditions"
    end
  end




  def full
    if @plane.length >= @capacity
       raise "airport is full"
    else
      plane = Plane.new
      #@plane << plane
	    land(plane)
    end
  end

  # def full
  #   plane = Plane.new
  #   @plane << plane
  #   fail "airport is full" if @plane.length == 1
  #   @plane
  # end

end
