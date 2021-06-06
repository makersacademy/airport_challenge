class Airport
  attr_reader :capacity, :weather

  DEFAULT_CAPACITY = 10 

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land_plane
  #   # fail "Plane already in airport" unless in_airport?(plane)
    fail "Airport is full" if airport_full?
  
  #   # plane.land_plane
  #   @planes << plane
    
  end

  def take_off
    fail "Grounded due to stormy weather" if stormy?
  #   fail "Plane not in airport" unless in_airport?(plane)

  #   @planes << plane
    "Successfull take-off"
  #   # in_airport?(plane)
  end

  # def get_planes
  #   @planes
  # end

  # def in_airport?(plane)
  #   @planes.include?(plane)
  # end

  def airport_full?
    true
    # @planes.count == @capacity
  end

  def current_weather(weather = "clear")
    @weather = weather
  end

  def stormy?
    rand > 0.75
  end

end
