class Airport

attr_reader :planes

  def initialize
    @planes = []
    weather = [:fine,:fine,:fine,:stormy]
    @weather = weather[rand(4)]
  end

  def land(plane)
    raise "Error: Planes cannot land in a storm" if stormy?
    @planes << plane
    plane.location = :airport
    @planes

  end

  def take_off(plane)
    raise "Error: that plane isn't at this airport" unless @planes.include? plane
    raise "Error: planes cannot take off in a storm" if stormy?
    plane.location = :air
    @planes.delete(plane)

  end

  def stormy?
    true if @weather == :stormy
  end
end
