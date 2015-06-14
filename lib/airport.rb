require_relative 'weather'

class Airport

  CAPACITY = 10

  def initialize capacity = CAPACITY
    @capacity = capacity 
    state
  end

  def to_sym
    state
  end

  def notified_take_off
    self.capacity -= 1
  end

  def notified_landing
    self.capacity += 1
  end

  private

  attr_accessor :state, :capacity, :weather

  def state
    if closed?
      puts "Airport currently not working"
      state = :closed
    else
      puts "Airport working"
      state = :opering
    end
  end

  def weather
    @weather = Weather.new
  end

  def closed?
    full? || ( weather.to_sym == :stormy )
  end

  def full?
    planes_on_land >= capacity
  end

  def planes_on_land
    number_of_planes_on_land
  end


  def number_of_planes_on_land
    rand capacity
  end

end
