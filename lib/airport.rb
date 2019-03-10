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
      case @weather.status
      when "⛈"
        puts "⛈ Sorry, too dangerous to land. ⛈"
      when "☀️"
        @planes << plane
        puts '☀️ Plane landed! ☀️'
      end
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
