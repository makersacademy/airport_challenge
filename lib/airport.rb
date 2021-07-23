require_relative "./plane"

class Airport
  #constants
  DEFAULT_CAPACITY = 20
  
  #attr reading
  attr_reader :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    #sets up the capacity, hanger and weather variables, capacity is settable to anything upon initialsation
    #the weather randomiser is quick and dirty for now but could be extended into its own class in the future to allow for further complexity
    @capacity = capacity
    @hanger = Array.new
    @weather = ["sunny", "sunny", "sunny", "stormy"].sample 
  end

  def weather_set(weather)
    #For debug specific weather setting
    @weather = weather
  end

  def land(plane)
    #Pushes a plane into the hanger, expects a plane object
    fail "The hanger is full!" if full_hanger?
    fail "The weather is too rough to land" if stormy?

    @hanger.push(plane)
  end
  
  def takeoff
    #pop off the last plane, can be extended to pull unique planes out in the future
    #by replaceing hanger.pop with hanger.custompullmethod
    fail "The're no planes to take off in the hanger" if empty_hanger?
    fail "The weather is too rough to takeoff" if stormy?

    @hanger.pop()
  end

  def empty_hanger?
    #quick empty hanger check
    return @hanger.empty?
  end

  def full_hanger?
    #quick full hanger check independent of custom set capacity
    return @hanger.length == @capacity
  end

  def stormy?
    #quick weather check for the current only blocking case,
    #should be replaced in the future if more weather cases are added
    return @weather == "stormy"
  end

end
