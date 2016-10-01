class Airport
  attr_accessor :plane_hangar
  attr_accessor :weather

  def initialize(weather = 10, capacity = 20)
    @weather = weather
    @plane_hangar = []
    @capacity = capacity
  end

  def randomise_weather
    @weather = Random.new.rand(10)
  end

  def land(plane)
    if weather?
      raise('Airport is full, unable to land') if full?
      plane.flying = false
      @plane_hangar << plane
    else
      raise('Cannot land in bad weather')
    end
  end

  def takeoff(plane)
    if weather?
      raise 'Already flying!' if plane.flying? == true
      index = @plane_hangar.index(plane)
      temp_plane = @plane_hangar[index]
      @plane_hangar.delete(plane)
      temp_plane.flying = true
      return temp_plane
    else
      raise('Cannot takeoff in bad weather')
    end
  end

  def full?
    if (@plane_hangar.size >= @capacity) then true else false end
  end

  def weather?
    if (@weather > 1) then true else false end
  end
end
