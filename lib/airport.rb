require_relative 'plane'

class Airport
  attr_reader :planes, :capacity, :weather
  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY, weather = false)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    fail "The airport is already full" if full?
    if @planes.include? plane
      "That plane is already in the airport" 
    else
      fail "The weather is too dangerous" if stormy?
      @planes.push(plane)
      "#{plane} has successfully landed."
    end
  end

  def take_off(plane)
    if @planes.include? plane
      fail "The weather is too dangerous" if stormy?
      @planes.delete(plane) 
      "#{plane} has successfully departed."
    else 
      "That plane is not in the airport"
    end
  end

 
  def full?
    @planes.length >= @capacity
  end

  def stormy?
    @random = random
    if (1..19).include?(@random)
      @weather = false
    else
      @weather = true
    end
  end

  private 

  def random
    rand(1..20)
  end
end