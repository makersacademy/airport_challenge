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

    raise "That plane has already landed!" unless !@planes.include?(plane)
    confirm_landing
    @planes << plane
  end

  def take_off(plane)
    raise "You cannot take off in a storm!" unless @weather == "Sunny"
    raise "That plane is already flying!" unless @planes.include?(plane)
    confirm_take_off
    @planes.pop
  end

  private

  def confirm_landing
    puts "The plane has landed!"
  end

  def confirm_take_off
    puts "The plane has taken-off!"
  end

  def weather_today
  end

end
