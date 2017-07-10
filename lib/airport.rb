require relative 'plane'

class Airport

  attr_reader :plane

  def initialize (capacity, weather)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def takeoff
    fail 'No planes here' if empty?
    @planes.pop
  end


  def land plane
    fail 'Airport full!' if full?
    @planes << plane
  end

private

  def empty?
    @planes.empty?
  end

  def full?
    @planes.count >= capacity
  end

end
