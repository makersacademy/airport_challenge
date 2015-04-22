class Airport
  HANGAR_SIZE = 6

  def initialize
    @planes = []
  end

  def land(plane)
    check_weather
    check_airport_not_full
    @planes << plane
    plane.touch_down
  end

  def take_off(plane = @planes.first)
    check_weather
    check_airport_not_empty
    plane.take_off
    @planes.delete(plane)
  end

  private

  def check_weather
    fail 'not now, storms brewing!' if local_weather == 'stormy'
  end

  def check_airport_not_empty
    fail 'airport is currently empty' if @planes.empty?
  end

  def check_airport_not_full
    fail 'airport is full' if @planes.length >= HANGAR_SIZE
  end

  def local_weather
    return 'stormy' if rand(1..5) == 5
    'sunny'
  end
end
