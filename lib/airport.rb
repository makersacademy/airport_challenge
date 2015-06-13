require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 15

  def initialize
    @planes = []
  end

  def capacity
    @capacity = DEFAULT_CAPACITY
  end

  def requesting_take_off
    fail 'Sorry - no planes to take off!' if empty?
    plane = @planes.pop
    plane.take_off
  end

  def empty?
    @planes.empty?
  end

  def landing plane
    fail 'The airport is full!' if @planes.count >= DEFAULT_CAPACITY
    plane.land
    @planes << plane
  end

  def traffic_control
    weather = rand(1..5)
    if weather == 5
      puts 'stormy'
    else
      puts 'sunny'
    end
  end

end
