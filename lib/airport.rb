require_relative 'plane'
require_relative 'weather'

class Airport
  # capacity can be changed and read by attr_accessor
  # 'plane' and 'stormy' can only be read by attr_reader
  attr_accessor :capacity
  attr_reader :planes, :stormy

  DEFAULT_CAPACITY = 10

  #let the starting capacity be 10
  def  initialize(weather,capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @stormy = weather.stormy?
  end

  def take_off
    if @stormy == true
      fail "too stormy to take off!"
    elsif empty? == true
      fail "Airport is empty!"
    else
      @planes.pop
    end
  end

  def land(plane)
    if @stormy == true
      fail "too stormy to land!"
    elsif full? == true
      fail "Airport is full!"
    else
      @planes << plane
    end
  end


  private

  def empty?
    @planes.empty?
  end

  def full?
    return true if @planes.size >= @capacity
  end

end
