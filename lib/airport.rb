class Airport
  attr_reader :planes
  
  DEFAULT_CAPACITY = 3

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @planes = []
    @capacity = capacity
  end
  
  def land(plane)
    raise "That plane is already on the ground!" if @planes.include? plane
    raise "⛈ Too dangerous to land. ⛈" if bad_weather?
    raise "Airport full" if @planes.size >= @capacity

    @planes << plane
    puts '☀️ Plane landed! ☀️'   
    self
  end

  def clear_for_takeoff(plane)
    raise "That plane is not at that airport!" unless @planes.include? plane

    if bad_weather?
      puts "⛈ Sorry, all aircraft grounded until further notice. ⛈"
    else
      @planes -= [plane]
      puts "☀️ Up, up and away! ☀️"
    end
    self
  end

  private

  def bad_weather?
    @weather.status == "⛈"
  end

end
