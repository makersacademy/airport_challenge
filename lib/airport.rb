class Airport

  attr_accessor :capacity
  attr_accessor :weather

  def initialize capacity = 10
    @planes = []
    @capacity = capacity
    @weather = self.weather_update
  end

  def capacity=(capacity)
    fail 'capacity cannot be lower than number of planes' if @planes.count > capacity
    @capacity = capacity
  end

  def receive plane
    if self.weather == 'stormy'
      fail 'plane cannot land when storm brewing'
    elsif @planes.count == @capacity
      fail 'airport cannot receive planes when at capacity'
    else
      plane.land
      @planes << plane
    end
  end

  def launch plane
    if self.weather == 'stormy'
      fail 'plane cannot take off when storm brewing'
    else
      plane.takeoff
      @planes.delete(plane)
    end
  end

  def planes
    @planes
  end

  def weather
    @weather
  end

  def weather_update
    if rand(1..10) == 1
      @weather = 'stormy'
    else
      @weather = 'sunny'
    end
  end

end
