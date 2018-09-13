
require_relative 'plane'
class Airport
  attr_reader :terminal,
              :capacity

  def initialize(capacity = 3)
    @capacity = capacity
    @terminal = []
  end

  def land(plane)
    fail 'Capacity is full' if full?
    fail 'Weather is bad for landing' if bad_weather
    if @terminal.include?(plane)
      return "#{plane} has already landed."
    else
      @terminal.push(plane)
      return "#{plane} has landed."
    end
  end

  def takeoff(plane)
    fail 'Weather is bad for taking off' if bad_weather
    @terminal.delete(plane)
    return "Take off was successful, #{plane} is in the air."
  end

  def weatherquality
    @weather = ['bad', 'good', 'good', 'good'].sample
  end

  private

  def bad_weather
    weatherquality == 'bad'
  end

  def full?
    @terminal.count >= @capacity
  end
end
