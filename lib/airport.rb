require_relative 'plane'

class Airport
  attr_reader :planes, :capacity

  def initialize
    @planes = []
    @capacity = 20
  end
  def land plane
    if full?
      raise "Sorry, we're full!"
    elsif weather == "stormy"
      raise "Nope, too dangerous to guide you in at the mo. Circle!"
    else
      plane.landing
      planes << plane
    end
  end
  def take_off
    raise "No planes here at the mo." unless !empty?
    raise "Nope, too dangerous to fly right now!" unless weather == "sunny"
    planes.last.taking_off
    planes.pop
  end

  private

  def full?
    planes.count >= capacity
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
