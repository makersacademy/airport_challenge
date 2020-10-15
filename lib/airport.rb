class Airport
  attr_reader :weather, :planes, :capacity

  def initialize(capacity = 50)
    @weather = generate_weather
    @planes = []
    @capacity = capacity
  end

  def generate_weather
    rng = rand(1..5)
    return rng == 5 ? "stormy" : "sunny"
  end

  def receive_plane(plane)
    if bad_weather?
      puts "Weather too dangerous to land"
      return
    end
    if airport_full?
      puts "Airport at maximum capacity"
      return
    end
    if plane.location == "flying"
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
  def bad_weather?
    @weather == "stormy"
  end

  def airport_full?
    @planes.length >= @capacity
  end
end
