require './lib/plane.rb'

class Airport
  attr_reader :hanger
  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hanger = []
  end

  def land(plane)
    raise "Can't land because it's stormy" if weather == 'stormy'
    raise "Can't land, airport is full" if @hanger.count == @capacity

    @hanger.push(plane)
  end

  def takeoff(plane)
    raise "Can't take off because it's stormy" if weather == 'stormy'

    @hanger.delete(plane)
  end

  def weather
    ['stormy', 'sunny', 'sunny'].sample
  end

end
