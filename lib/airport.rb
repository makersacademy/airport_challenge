class Airport
  attr_reader :planes
  
  def initialize(weather)
    @weather = weather
    @planes = []
  end
  
  def land(plane)
    @planes << plane
    puts 'Plane landed!'
    self
  end

  def clear_for_takeoff(plane)
    case @weather.status
    when "⛈"
      puts "⛈ Sorry, all aircraft grounded until further notice. ⛈"
    when "☀️"
      puts "☀️ Up, up and away! ☀️"
      @planes -= [plane]
    end
    self
  end

end
