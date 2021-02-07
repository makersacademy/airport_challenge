class Airport 
  DEFAULT_CAPACITY = 20 # default airport capacity
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity 
    @planes = [] 
  end 
  
  # run type allows for sunny tests / stormy tests. To bypass random weather.  
  
  def weather_generator(run_type)
    # if block to allow garanteed stormy weather for testing stormy takeoff error
    if run_type == "stormy_test" 
      # in the 'stromy_test' condition the weather will alwasys be stormy  
      @weather = "stormy" 
    # default value for testing that is not dependant on weather.   
    elsif run_type == "sunny_test" 
      @weather = "sunny"
    # value for when random weather is required. Default running condition 
    elsif run_type == "run" 
      weather_gen = rand(10)
      (weather_gen >= 8) ? (@weather = "stormy") : (@weather = "sunny") 
    end
  end  
  
  def land(plane, run_type = "run") 
    full?
    weather_generator(run_type)
    weather? 
    (@planes.size < @capacity) ? @planes << plane : nil
  end

  def take_off(plane, run_type = "run")
    empty?
    weather_generator(run_type)
    weather?
    @planes.delete(plane)
    true 
  end 
end 

# checks to see if airport is full. And thus no planes can land here. 
def full? 
  fail "Airport Full. Cannot Land" if @planes.size >= @capacity 
end

# checks to see if the airport is empty. And thus no planes can take off from it. 
def empty? 
  fail "Airport Empty" if @planes.size == 0 
end

# checks to see if stormy weather. If so It return error"  
def weather? 
  fail "Weather Stormy" if @weather == "stormy" 
end 

class Plane
  
end
