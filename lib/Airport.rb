class Airport
  @maxPlanes
  MAXSIZE = 50 #tiny airport
  @weather = :sunny

  def initialize(maxPlanes = MAXSIZE)
    @planes = []
    @maxPlanes = maxPlanes

  end

  def landPlane(plane)
    fail "already landed" if (plane.landed == true)
    fail "Airport full" if (@planes.length >= @maxPlanes)
    fail "Bad weather" if @weather == :stormy
    plane.landPlane
    @planes << plane
    return plane
  end

  def takeOff
    fail "No planes at airport" if @planes.length == 0
    fail "Bad weather" if @weather == :stormy
    plane = @planes.pop
    plane.takeOff
    return plane
  end

  def changeWeather(weather)
    @weather = weather
  end
end