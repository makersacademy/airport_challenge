require_relative 'plane'

class Airport
  attr_reader :planes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 60

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    weather_good_today?
    raise "That plane has already landed!" unless !@planes.include?(plane)
    raise "You cannot land in a storm" unless weather_today_good?
    raise "This airport is full!" unless !full?
    confirm_landing
    @planes << plane
  end

  def take_off(plane)
    weather_good_today?
    raise "That plane isn't in this airport!" unless @planes.include?(plane)
    raise "You cannot take off in a storm!" unless weather_today_good?
    confirm_take_off
    @planes.delete(plane)
  end

  private

  def confirm_landing
    puts "The plane has landed!"
  end

  def confirm_take_off
    puts "The plane has taken-off!"
  end

  def full?
    return true if @planes.length >= @capacity
  end

  def weather_good_today?
    @weather = (rand(11))
    if @weather < 6
      true
    else
      false
    end
  end
end
