class Airport
  attr_reader :weather, :planes, :capacity

  def initialize(capacity = 50)
    @weather = Weather.new
    @planes = []
    @capacity = capacity
  end

  def receive_plane(plane)
    return if landing_problems?

    if plane.location == :flying
      @planes << plane
      plane.land(self)
    else
      puts "This plane is not currently flying"
    end
  end

  def release_plane(plane)
    if bad_weather?
      puts "Weather too dangerous to take off"
      return
    end
    if plane.location == self
      @planes = @planes.filter { |landed_plane| landed_plane != plane }
      plane.takeoff
    else
      puts "This plane is not at this airport"
    end
  end

  private
  def landing_problems?
    if bad_weather?
      puts "Weather too dangerous to land"
      return true
    end
    if airport_full?
      puts "Airport at maximum capacity"
      return true
    end
  end

  def bad_weather?
    @weather.weather == :stormy
  end

  def airport_full?
    @planes.length >= @capacity
  end
end
