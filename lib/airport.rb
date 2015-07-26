require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :planes

  def initialize
    @planes = []
  end
  def land plane
    if full?
      raise "Sorry, we're full!"
    elsif weather == "stormy"
      raise "Nope, too dangerous to guide you in at the mo. Circle!"
    else
      (@planes << plane)
      plane.landing
    end
  end
  def take_off plane
    raise "No planes here at the mo." unless !empty?
    raise "Nope, too dangerous to fly right now!" unless weather == "sunny"
    @planes.pop
    plane.taking_off
  end
  def full?
    planes.count >= DEFAULT_CAPACITY
  end
  def empty?
    planes.empty?
  end
  def weather
    num = 1 + rand(5)
    if num == 5
      "stormy"
    else
      "sunny"
    end
  end
end
