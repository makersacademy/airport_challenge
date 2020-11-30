require './lib/weather.rb'

class Airport
  attr_reader :hanger, :capacity, :weather
  attr_writer :weather
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
    @weather = Weather.new.stormy
  end

  def land(plane)
    return @hanger.push(plane) unless (full? || @weather == true)
    return fail 'Too stormy' if @weather == true
  end

  def take_off(plane)
    return @hanger.delete(plane) unless @weather == true
    return fail 'Too stormy' if @weather == true
  end

  private 

  def full?
    raise 'Airport Full!' if @hanger.count >= @capacity
  end

end
