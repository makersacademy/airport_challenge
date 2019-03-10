class Airport
  attr_reader :planes
  
  DEFAULT_CAPACITY = 10

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @planes = []
  end
  
  def land(plane)
    
    if @planes.size >= DEFAULT_CAPACITY
      puts "Sorry, no more room!"
      return self
    end

    case @weather.status
    when "⛈"
      puts "⛈ Sorry, too dangerous to land. ⛈"
    when "☀️"
      @planes << plane
      puts '☀️ Plane landed! ☀️'
    end
    
    self
  end

  def clear_for_takeoff(plane)
    case @weather.status
    when "⛈"
      puts "⛈ Sorry, all aircraft grounded until further notice. ⛈"
    when "☀️"
      @planes -= [plane]
      puts "☀️ Up, up and away! ☀️"
    end
    self
  end

end
