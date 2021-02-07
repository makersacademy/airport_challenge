class Airport 
  DEFAULT_CAPACITY = 20 # default airport capacity
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity 
    @planes = [] 
    @weather  
  end 
    
  def weather_generator(run_type) # run type allows for sunny tests / stormy tests. To bypass random weather for test where not needed. 
    if run_type == "stormy_test" # if block to allow garanteed stormy weather for testing stormy takeoff error
      @weather = "stormy" # in the 'test' condition the weather will alwasys be stormy
    elsif run_type == "sunny_test" # default value for testing that is not dependant on weather. 
      @weather = "sunny"
    elsif run_type == "run" # value for when random weather is required. Default running condition 
      weather_gen = rand(10)
      (weather_gen >= 8) ? (@weather = "stormy") : (@weather = "sunny") # otherwise it will use the weather_gen vaiable to assign wetaher
    end
  end  
  
  def land(plane, run_type = "run") 
    full?
    @weather = weather_generator(run_type)
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

def full? # checks to see if airport is full. And thus no planes can land here. 
  fail "Airport Full. Cannot Land" if @planes.size >= @capacity 
end

def empty? # checks to see if the airport is empty. And thus no planes can take off from it. 
  fail "Airport Empty" if @planes.size == 0 
end

def weather? # checks to see if stormy weather. If so It return error"  
  fail "Weather Stormy" if @weather == "stormy" 
end 

class Plane
  
end
