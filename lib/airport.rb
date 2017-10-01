require_relative './weather'

class Airport

  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @weather = Weather.new
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise 'plane has already landed' if plane.landed
    raise 'cannot land at full airport' if full?
    raise 'cannot land in stormy weather' unless cleared?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    raise 'plane is already in the air' unless plane.landed
    raise 'plane is not at this airport' unless here?(plane)
    raise 'cannot take off in stormy weather' unless cleared?
    plane.take_off
    @planes.delete(plane)
  end

  private 

    def cleared?
      !@weather.stormy?
    end

    def here?(plane)
      planes.include?(plane)
    end

    def full?
      @planes.count >= capacity
    end

end