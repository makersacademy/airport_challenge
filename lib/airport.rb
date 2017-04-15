class Airport

  # Weather is good when set to '1' and stormy when '0'
  WEATHER = 1

  attr_reader :planes
  attr_accessor :weather

  def initialize(x = WEATHER)
    @planes = []
    @weather = x
  end

  def land_plane(plane)
    @planes << plane if !weather?
  end

  def plane_take_off
    @planes.pop if !weather?
  end

  def weather?
    raise ArgumentError, "Weather Stormy!", caller if @weather == 0
  end

  def rand_weather
    @weather = [0, 1].sample
  end

  private :weather?, :rand_weather

end
