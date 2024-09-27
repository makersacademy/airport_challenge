class Airport
  attr_accessor :landed_planes
  attr_accessor :weather
  attr_accessor :capacity

  DEFAULT_CAPACITY = 8

  def initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes = []
    @weather = rand(10)
    @capacity = capacity
  end

  def land(aeroplane)
    if @weather == 1 && @landed_planes.count < @capacity
      return "Stormy conditions, #{aeroplane} cannot safely land"
    elsif @landed_planes.count >= @capacity
      return "Airport is at max capacity"
    else
      @landed_planes << aeroplane
    end
  end

  def takeoff(aeroplane)
    if @weather == 1
      return "Stormy conditions, #{aeroplane} cannot take off"
    else
      @landed_planes.delete(aeroplane)
      if @landed_planes.include?(aeroplane) == false
        aeroplane.capitalize![0]
        puts "#{aeroplane} has taken off"
      end
    end
  end
end
