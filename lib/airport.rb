require "./lib/plane"
require "./lib/weather"

class Airport

  attr_reader :planes
  attr_reader :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @weather = ""
    @planes = []
  end

  def land(plane)
    checks_safety
    checks_if_plane_already_in_hangar(plane)
    checks_current_capacity
    @planes << plane
  end

  def takeoff
    checks_planes_available_to_takeoff
    checks_safety
    plane_takeoff_announcement
    @planes.pop
  end

  private

  def plane_takeoff_announcement
    puts "#{@planes[-1]} has left the airport"
  end

  def checks_current_capacity
    fail "This airport is currently at maximum capacity" unless @capacity > @planes.length
  end

  def checks_if_plane_already_in_hangar(plane)
    return if @planes.empty?
    fail "#{plane} has already landed" unless @planes.include?(plane) == false
  end

  def checks_weather
    @weather = Weather.new.current_weather
  end

  def checks_safety
    fail "It is too stormy" unless checks_weather == "sunny"
  end

  def checks_planes_available_to_takeoff
    fail "There are no planes in the hangar" unless @planes.empty? == false
  end

end
