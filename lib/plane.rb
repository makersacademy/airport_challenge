class Plane

  def initialize
    @planes = []
  end

attr_reader :plane, :stormy

  def land
  end

  def takeoff
  end

  def stormy_weather
    fail 'planes cannot takeoff' if stormy?
  end

  def stormy?
    false
   end

end
