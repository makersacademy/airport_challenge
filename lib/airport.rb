require_relative 'plane'

class Airport
  attr_reader :planes, :weather
  attr_accessor :capacity
  DEFAULT_CAPACITY = 60

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity

  end

  def land(plane)
    raise "It is too stormy to land" unless weather_good_today?
    raise "That plane has already landed!" unless !@planes.include?(plane)
    raise "This airport is full!" unless !full?
    confirm_landing
    @planes << plane
  end

  def take_off(plane)
    raise "It is too stormy to take_off" unless weather_good_today?
    raise "That plane isn't in this airport!" unless @planes.include?(plane)
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
    true unless @weather > 8
  end
end
