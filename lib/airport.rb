class Airport
  attr_accessor :plane_hangar
  attr_accessor :weather  #if weather is 1, it is too stormy to fly
  attr_accessor :capacity

  def initialize(weather = 10, capacity = 20)
    @weather = weather
    @plane_hangar = []
    @capacity = capacity
    @prng = Random.new
  end

  def randomise_weather
    @weather = @prng.rand(10)
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
      temp_plane = @plane_hangar[plane]
      puts 'works1'
      @plane_hangar.delete(plane)
      puts 'works2'
      temp_plane.flying = true
      puts 'works3'
      return temp_plane
      puts 'works4'
    else
      raise('Cannot takeoff in bad weather')
    end
  end

  def full?
    if @plane_hangar.size == @capacity
      true
    else
      false
    end
  end

  def weather?
    if @weather > 1
      true
    else
      false
    end
  end
end
