=begin
The code below essentially works, but i need to run weatherquality on Airport
to manually set the weather (no good). So, if i were to uncomment the comments below
and then comment out lines 21 and 33, the code also works when i test it in IRB,
allowing a random 'weather' to be set before each landing and take off.
However my rspec isnt set for that and i could not figure out how to do that. So
i decided to keep it like this.
=end
require_relative 'plane'
class Airport
  attr_reader :terminal, :capacity

  def initialize(capacity = 3)
    @capacity = capacity
    @terminal = [] #empty terminal
  end

  def land(plane)
    self.weatherquality
    fail 'Capacity is full' if full?
    #fail 'Weather is bad for landing' if @weather == 'bad'
    fail 'Weather is bad for landing' if self.weatherquality == 'bad'
    if @terminal.include?(plane)
      return "#{plane} has already landed."
    else
      @terminal.push(plane)
      return "#{plane} has landed."
    end
  end

  def takeoff(plane)
    self.weatherquality
    #fail 'Weather is bad for taking off' if @weather == 'bad'
    fail 'Weather is bad for taking off' if self.weatherquality == 'bad'
    @terminal.delete(plane)
    return "Take off was successful, #{plane} is in the air."
  end

  def weatherquality
    @weather = ['bad', 'good'].sample
  end

  private
  def full?
    @terminal.count >= @capacity
  end
end
