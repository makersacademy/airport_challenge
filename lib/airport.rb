require_relative 'plane'
require_relative 'weather_tower'
class Airport
  attr_accessor :runway, :capacity, :tower
  DEFAULT_CAPACITY = 30

  def initialize(capacity = DEFAULT_CAPACITY)
    @runway = []
    @capacity = capacity
    @green_light = false
    @tower = WeatherTower.new
  end

  def view_runway
    @runway
  end

  def request_weather_report(tower = @tower)
    if tower.safe_to_fly?
      "The tower says: Skies are all clear"
      @green_light = true
    else
      "The tower says: Weather conditions are unsafe, wait and try again later"
      @green_light = false
    end
  end

  def land(plane)
    if weather_ok?
      fail 'Cannot land when airport is full' if full?
      fail 'This plane is already grounded' if plane.flying? == false

      @runway << plane
      plane.change_status
    else
      fail "Cannot land in current weather conditions"
    end
  end

  def take_off(plane)
    if weather_ok?
      fail "Plane is already airborne" if plane.flying?

      @runway.delete(plane)
      plane.change_status
    else
      fail "Cannot take off in current weather conditions"
    end
  end

  def full?
    @runway.count >= @capacity
  end

  def empty?
    @runway.empty?
  end

  def weather_ok?
    @green_light == true
  end

end
