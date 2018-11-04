require_relative 'plane'

class Airport

  attr_reader :capacity, :planes, :weather

  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY, planes = [], weather = '')
    @capacity = capacity
    @planes = planes
    @weather = weather
  end

  def set_weather(condition = rand(10))
    condition == 0 ? @weather = 'stormy' : @weather = 'sunny'
  end

  def land(plane)
    fail "That plane is already at the airport." if @planes.include?(plane)
    full?
    stormy?
    @planes << plane
  end

  def take_off(plane)
    fail "That plane is not at the airport." unless @planes.include?(plane)
    stormy?
    @planes.delete(plane)
  end

private

  def stormy?
    fail "Sorry, it is too stormy." if @weather == 'stormy'
  end

  def full?
    fail "Sorry, airport is full." unless @planes.count < @capacity
  end

end
