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
    if @weather.forecast == "⛈"
      puts "⛈ Sorry, all aircraft grounded until further notice. ⛈"
    elsif @weather.forecast == "☀️"
      puts 'Up, up and away!'
      @planes -= [plane]
    end
    self
  end

end
