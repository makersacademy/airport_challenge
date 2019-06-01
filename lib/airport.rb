require './lib/plane.rb'

class Airport
  attr_reader :hanger

  def initialize
    @hanger = []
  end

  def land(plane)
    raise "Can't land because it's stormy" if weather == 'stormy'
    raise "Can't land, airport is full" if @hanger.count.positive?

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
