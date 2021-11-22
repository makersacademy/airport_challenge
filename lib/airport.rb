require_relative 'plane'
require_relative 'weather'

class Airport

attr_reader :planes, :weather
DEFAULT_CAPACITY = 1


  def initialize (desired_capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @planes_taken_off = []
    @capacity = desired_capacity
    @weather = weather
  end

  def land(plane)
    if @planes.count == 0 && @weather.stormy? == "false"
        @planes.push(plane)
    elsif @planes.count == DEFAULT_CAPACITY
        fail "Airport full"
    else fail "Weather is too stormy"
    end
  end

  def takeoff(plane)
    #fail "Weather is stormy" if @weather.stormy?
    if @weather.stormy? == "false"
        @planes.pop
    end
    puts "#{plane} has now taken off! There are currently #{@planes.count} planes in the airport."
    @planes_taken_off << plane
  end
end