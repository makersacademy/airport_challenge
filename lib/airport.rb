require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity

  def initialize (capacity = DEFAULT_CAPACITY)

    @capacity = capacity
    @planes = []

  end

  def take_off
    if stormy?    
      raise 'The weather is too stormy to take-off'
    elsif empty?
      raise 'The airport is empty' 
    else
      planes.last.take_off
      planes.pop
    end

  end

  def landing plane

    if stormy?    
      raise 'The weather is too stormy to land'
    elsif full?
      raise 'The airport is currently full'
    else
      planes << plane
      plane.landing
    end
  end

   def empty?

    planes.count == 0

  end

  private

  attr_reader :planes

  def full?

    planes.count >= capacity

  end

  def weather
    rand(10) > 8 ? 'stormy' : 'sunny'

  end

  def stormy?
    weather == 'stormy'
  end

end








