class Airport

  attr_accessor :capacity
  attr_accessor :weather

  def initialize capacity = 10
    @planes = []
    @capacity = capacity
    @weather = ['sunny', 'stormy'].sample
  end

  def receive plane
    p self.weather
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

end
