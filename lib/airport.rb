class Airport
  CAPACITY = 20
  attr_writer :plane
  attr_reader :planes

  def initialize
    @planes = Array.new(0)
  end

  def takeoff_plane
    @planes.empty? || !@sunny ? (fail 'cannot takeoff') : @planes.pop
  end

  def land_plane p
    if @planes.length >= CAPACITY || !@sunny
      (fail 'cannot land')
    else
      p.flying = false
      @planes << p
    end
  end

  def atc
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

  def plane_state _plane
  end
end
