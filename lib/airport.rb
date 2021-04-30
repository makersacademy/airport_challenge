require './lib/plane.rb'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :capacity
  attr_reader :plane

  def initialize(capacity = DEFAULT_CAPACITY)
    @airports = []
    @capacity = capacity
  end

  def land_plane(plane)
    fail 'Airport is full!' if full?
    
    @airports << plane   
  end

  def take_off(plane)
    puts "Airport currently has #{@airports}"
    puts "#{plane} has taken off!"
    @airports.pop
    puts "Airport now has #{@airports}"
  end

  private

  def full?
    @airports.count >= capacity
  end
end
