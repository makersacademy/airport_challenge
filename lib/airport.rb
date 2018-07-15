require_relative 'plane'
class Airport
  attr_reader :terminal, :capacity

  def initialize(capacity = 3)
    @capacity = capacity
    @terminal = [] #empty terminal
  end

  def land(plane)
    fail 'Weather is bad for landing' if @weather == 'bad'
    fail 'Capacity is full' if full?
    if @terminal.include?(plane)
      return "#{plane} has already landed."
    else
      @terminal.push(plane)
      return "#{plane} has landed."
    end
  end

  def takeoff(plane)
    fail 'Weather is bad for taking off' if @weather == 'bad'
    @terminal.delete(plane)
    return "Take off was successful, #{plane} is in the air."
  end

  def weatherquality
    @weather = ['bad','good'].sample
  end

  private
  def full?
    @terminal.count >= @capacity
  end
end
