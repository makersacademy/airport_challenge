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
    if @weather.status == "⛈"
      puts "⛈ Sorry, all aircraft grounded until further notice. ⛈"
    elsif @weather.status == "☀️"
      puts "Up, up and away!"
      @planes -= [plane]
    end
    self
  end

end
