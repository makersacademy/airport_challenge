class Airport
  attr_reader :planes
  
  def initialize(weather)
    @weather = weather
    @planes = []
  end
  
  def land(plane)
    case @weather.status
    when "⛈"
      puts "⛈ Sorry, too dangerous to land. ⛈"
    when "☀️"
      @planes << plane
      puts 'Plane landed!'
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
