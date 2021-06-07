class Airport
  attr_accessor :planes, :capacity, :weather

  DEFAULT_CAPACITY = 10 

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land_plane(plane)
    if weather == "clear" && !at_capacity?
      planes << plane
    elsif weather == "stormy"
      fail "Too stormy to land"
    elsif at_capacity?
      fail "Airport is full"
   
    end
    
  end

  def take_off(*)
    raise "Grounded due to stormy weather" if weather == "stormy"
      
    "Successfull take-off"
  
  end

  def at_capacity?
    planes.count == capacity

  end

  def current_weather(weather = "clear")
    @weather = weather

  end

  def stormy?
    rand > 0.75

  end

end
