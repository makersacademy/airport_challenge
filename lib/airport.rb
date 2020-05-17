require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def landing(plane)
    weather_check
    capacity_check
    @planes.push(plane)
  end

  def depart(plane)
    weather_check
    @planes.delete(plane)
    plane_left_notification(plane)
  end

private

  def plane_left_notification(plane)
    puts "#{plane} has left the airport"
    if @planes.empty?
      puts "No planes now docked #{self}"
    else
      puts "Planes currently docked at #{self}: #{@planes.join(', ')}"
    end
  end

  def full?
    @planes.count >= @capacity
  end

  def capacity_check
    fail "Airport at capacity" if full?
  end

  def the_weather
    Weather.new.status
  end

  def weather_check
    fail 'DANGER: Storm Forecast' if the_weather == 'stormy'
  end

end
