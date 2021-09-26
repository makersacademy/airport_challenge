require './lib/weather'

class Airport
  attr_reader :capacity, :planes, :weather

  def initialize(capacity = 10)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    raise 'Airport full' if full?
    if weather.status == 'stormy'
      puts "Plane cannot land in stormy weather"
    else
      @planes << plane
    end
  end

  def takeoff
    if weather.status == 'stormy'
      puts "Plane cannot takeoff in stormy weather"
    else
      @planes.pop
    end
  end

  private

  def full?
    @planes.count >= @capacity
  end
end
