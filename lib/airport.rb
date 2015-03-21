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

  def take_off
    fail 'not now, storms brewing!' if local_weather == 'stormy'
    fail 'airport is currently empty' if @planes.empty?
  end

  def local_weather
    %w(stormy sunny).shuffle.first
  end
end
