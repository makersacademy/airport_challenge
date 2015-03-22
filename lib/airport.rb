class Airport
  CAPACITY = 20
  attr_writer :plane
  attr_reader :planes

  def initialize
    @planes = Array.new(0)
  end

  def takeoff_plane
    if @planes.empty? || !@sunny
      fail 'cannot takeoff'
    else
      @planes.last.take_off
      @planes.pop
    end
  end

  def land_plane p
    if @planes.length >= CAPACITY || !@sunny
      fail 'cannot land'
    else
      p.land
      @planes << p
    end
  end

  def capcity
    CAPACITY
  end

  def num_planes
    @planes.length
  end

  def weather weather
    @sunny = (weather.weather == 'sunny')
  end
end
