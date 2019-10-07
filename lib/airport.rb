class Airport

  DEFAULT_CAPACITY = 10
  attr_accessor :capacity, :planes

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  # I attempted to detemine weather randomly using this method,
  # but it instead broke all of my tests! If I had more time to implement this,
  # I would be able to run a test that if the randomised weather was stormy,
  # to raise the error.

  # def weather_conditions(weather)
  #   var = rand(2)
  #   if var = 0
  #     weather = 'sunny'
  #   else
  #     weather = 'stormy'
  #   end
  # end
  #
  # def bad_weather?(weather)
  #   weather == 'stormy'
  # end

  def weather_conditions(input)
    @weather = input
  end

  def bad_weather?
    @weather == 'stormy'
  end

  # Replaced with attr_accessor :planes
  # def print_planes
  #   @planes
  # end

  def land_plane(plane)
    raise 'Airport is full' if airport_full?

    raise 'Weather is bad!' if bad_weather?

    @planes << plane
  end

  def take_off_plane
    raise 'Weather is bad!' if bad_weather?

    @planes.pop
  end

  def airport_full?
    @planes.count >= capacity
  end

end
