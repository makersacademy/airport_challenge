class Airport
  attr_accessor :planes, :capacity, :weather

  DEFAULT_CAPACITY = 10 

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land_plane(plane)
    if weather == "clear" && !airport_full?
      planes << plane
    elsif weather == "stormy"
      fail "Too stormy to land"
    elsif airport_full?
      fail "Airport is full"
   
    end
    
  end

  def take_off(plane)
    raise "Grounded due to stormy weather" if weather == "stormy"
      
    "Successfull take-off"
  
  end

  def in_airport?(plane)
    @planes.include?(plane)

  end

  def airport_full?
    planes.count == capacity

  end

  def current_weather(weather = "clear")
    @weather = weather

  end

  def stormy?
    rand > 0.75
    
  end

end
