class Airport
  attr_reader :planes
  
  DEFAULT_CAPACITY = 10

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @planes = []
    @capacity = capacity
  end
  
  def land(plane)
    
    if @planes.size >= @capacity
      puts "Sorry, no more room!"
    else
      if bad_weather?
        puts "⛈ Sorry, too dangerous to land. ⛈"
      else
        @planes << plane
        puts '☀️ Plane landed! ☀️'
      end
    end
    
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
