class Airport
  def initialize
    @planes = []
  end

  def land(plane)
    fail 'not now, storms brewing!' if local_weather == 'stormy'
    fail 'airport is full' if @planes.length >= 6
    @planes << plane
    plane.touch_down
  end

  def take_off(plane = @planes.first)
    fail 'not now, storms brewing!' if local_weather == 'stormy'
    fail 'airport is currently empty' if @planes.empty?
    plane.take_off
    @planes.delete(plane)
  end

  def local_weather
    %w(stormy sunny).shuffle.first
  end
end
